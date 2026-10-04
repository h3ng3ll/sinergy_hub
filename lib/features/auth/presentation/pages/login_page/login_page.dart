import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../register_page/widgets/inputs/email_input.dart';
import '../register_page/widgets/inputs/password_input.dart';
import 'bloc/login_bloc/login_bloc.dart';

/// Poll Firebase every [_kVerificationPollInterval] while the user is on the
/// verify-email step. Only runs on this screen, so the cost is bounded.
const Duration _kVerificationPollInterval = Duration(seconds: 3);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = getIt<LoginBloc>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Timer? _verificationPollTimer;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _stopPolling();
    _emailController.dispose();
    _passwordController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  void onForgetPassword() {
    ResetPasswordPageRoute().navigate(
      context,
    );
  }

  void login() {
    /// if validation not meet requirements return
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();
    _loginBloc.add(
      LoginEvent.login(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void onResendVerification() {
    _loginBloc.add(
      const LoginEvent.resendVerification(),
    );
  }

  void _startPolling() {
    _verificationPollTimer?.cancel();
    _verificationPollTimer = Timer.periodic(
      _kVerificationPollInterval,
      (_) => _loginBloc.add(
        const LoginEvent.checkVerification(),
      ),
    );
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
            BlocListener<LoginBloc, LoginState>(
              bloc: _loginBloc,
              listener: (context, state) {
                if (state.status == LoginStatus.failed) {
                  UiMessageService.showError(
                    state.errorMessage,
                  );
                }
              },
            ),
            BlocListener<LoginBloc, LoginState>(
              bloc: _loginBloc,
              listenWhen: (p, n) =>
                  !p.isPendingVerification && n.isPendingVerification,
              listener: (context, state) {
                UiMessageService.showInfo(
                  'Your email is not verified yet. A verification link has '
                  'been sent to ${_emailController.text}',
                  timeInSecondsDuration: 10,
                );
                _startPolling();
              },
            ),
            BlocListener<LoginBloc, LoginState>(
              bloc: _loginBloc,
              listenWhen: (p, n) =>
                  p.isPendingVerification && (n.isAuthorized || n.isFailed),

              /// AuthBloc's watchUser fires after the reload inside
              /// CompleteRegistrationUseCase, so isEmailVerified flips and the
              /// router redirect leaves this page on its own.
              listener: (context, state) => _stopPolling(),
            ),
          ],
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: _loginBloc,
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: HorizontalPadding(
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Login',
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
                              ActionBtn(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 20.0,
                                ),
                                onPressed: login,
                                child: Text(
                                  'Login',
                                  style: textTheme.medium16.copyWith(
                                    color: colorScheme.onSecondary,
                                  ),
                                ),
                              ),
                              if (state.isPendingVerification) ...[
                                Gap(24.0),
                                Text(
                                  'Check your email for the verification link.',
                                  textAlign: TextAlign.center,
                                  style: textTheme.medium16.copyWith(
                                    color: AppColors.white.value,
                                  ),
                                ),
                                Gap(12.0),
                                CircularProgressIndicator(
                                  color: AppColors.white.value,
                                ),
                                Gap(16.0),
                                ActionBtn(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 20.0,
                                  ),
                                  onPressed: state.canResend
                                      ? onResendVerification
                                      : null,
                                  child: Text(
                                    state.isCounting
                                        ? 'Resend in ${state.resendCountdown}s'
                                        : 'Resend verification email',
                                    style: textTheme.medium16.copyWith(
                                      color: colorScheme.onSecondary,
                                    ),
                                  ),
                                ),
                              ],
                              Gap(30.0),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: onForgetPassword,
                                  child: Text(
                                    'Forget password ?',
                                    style: textTheme.medium16.copyWith(
                                      color: colorScheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoading) LoadingDataWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
