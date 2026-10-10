import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../domain/use_cases/complete_registration_use_case.dart';
import '../../../domain/use_cases/register_use_case.dart';
import 'bloc/register_bloc/register_bloc.dart';
import 'widgets/inputs/email_input.dart';
import 'widgets/inputs/password_input.dart';

/// Poll Firebase every [_kVerificationPollInterval] while the user is on
/// the verification step. Only runs on this screen, so the cost is bounded.
const Duration _kVerificationPollInterval = Duration(seconds: 3);

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterBloc _registerBloc = RegisterBloc(
    registerUseCase: getIt<RegisterUseCase>(),
    completeRegistrationUseCase: getIt<CompleteRegistrationUseCase>(),
  );
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _repeatPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Timer? _verificationPollTimer;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _verificationPollTimer?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _registerBloc.close();
    super.dispose();
  }

  void register() {
    /// if validation not meet requirements return
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_passwordController.text != _repeatPasswordController.text) {
      UiMessageService.showError(
        'Password are differs.',
      );
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    _registerBloc.add(
      RegisterEvent.register(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _startPolling() {
    _verificationPollTimer?.cancel();
    _verificationPollTimer = Timer.periodic(
      _kVerificationPollInterval,
      (_) => _registerBloc.add(
        const RegisterEvent.checkVerification(),
      ),
    );
  }

  void goToLogin() {
    _stopPolling();
    LoginPageRoute().replace(context);
  }

  void _stopPolling() {
    _verificationPollTimer?.cancel();
    _verificationPollTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BuildAnimatedBackground(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: MultiBlocListener(
          listeners: [
            BlocListener<RegisterBloc, RegisterState>(
              bloc: _registerBloc,
              listener: (context, state) {
                if (state.isFailed) {
                  UiMessageService.showError(
                    state.errorMessage,
                  );
                }
              },
            ),
            BlocListener<RegisterBloc, RegisterState>(
              bloc: _registerBloc,
              listenWhen: (p, n) =>
                  !p.isPendingVerification && n.isPendingVerification,
              listener: (context, state) {
                UiMessageService.showInfo(
                  'Mail verification has been sent to provided email address',
                  timeInSecondsDuration: 10,
                );
                _startPolling();
              },
            ),
            BlocListener<RegisterBloc, RegisterState>(
              bloc: _registerBloc,
              listenWhen: (p, n) =>
                  p.isPendingVerification &&
                  (n.isRegistered || n.isFailed || n.isSessionLost),
              listener: (context, state) {
                /// AuthBloc's _listen is subscribed to watchUser() which
                /// fires after the reload() inside CompleteRegistrationUseCase,
                /// so isEmailVerified flips and the router redirect engages
                /// without any explicit AuthBloc event from here.
                _stopPolling();
              },
            ),
            BlocListener<RegisterBloc, RegisterState>(
              bloc: _registerBloc,
              listenWhen: (p, n) => !p.isSessionLost && n.isSessionLost,
              listener: (context, state) {
                UiMessageService.showInfo(
                  'Your account has been created. Please log in with your email and password.',
                  timeInSecondsDuration: 10,
                );
                goToLogin();
              },
            ),
          ],
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: _registerBloc,
            builder: (context, state) {
              return SingleChildScrollView(
                child: HorizontalPadding(
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Register',
                              style: textTheme.medium32.copyWith(
                                color: AppColors.white.value,
                              ),
                            ),
                          ),
                          Gap(32.0),
                          EmailInput(
                            controller: _emailController,
                          ),
                          Gap(24.0),
                          PasswordInput(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          Gap(24.0),
                          PasswordInput(
                            controller: _repeatPasswordController,
                            hintText: 'Repeat password',
                          ),
                          Gap(24.0),
                          ActionBtn(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                            onPressed: state.canResend ? register : null,
                            child: Text(
                              state.isCounting
                                  ? 'Resend in ${state.resendCountdown}s'
                                  : 'Register',
                              style: textTheme.medium16.copyWith(
                                color: colorScheme.onSecondary,
                              ),
                            ),
                          ),
                          if (state.isPendingVerification) ...[
                            Gap(16.0),
                            Text(
                              'We sent a verification link to ${_emailController.text}.\n'
                              'Open it, then come back to the app — you will continue automatically.\n\n'
                              'Your account is already created. If nothing happens after verifying, just log in with your email and password.',
                              textAlign: TextAlign.center,
                              style: textTheme.medium16.copyWith(
                                color: AppColors.white.value,
                              ),
                            ),
                            Gap(12.0),
                            CircularProgressIndicator(
                              color: AppColors.white.value,
                            ),
                            Gap(12.0),
                            TextButton(
                              onPressed: goToLogin,
                              child: Text(
                                'Already verified? Log in',
                                style: textTheme.medium16.copyWith(
                                  color: AppColors.white.value,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.white.value,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
