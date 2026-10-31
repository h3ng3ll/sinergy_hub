import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/error_message_widget.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../../../core/utils/platform_helper.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import 'widgets/or_divider.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()..onTap = onTapTermsOfUse;
    _privacyRecognizer = TapGestureRecognizer()..onTap = onTapPrivacyPolicy;
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  void onAuthWithGoogle() {
    context.read<AuthBloc>().add(
      AuthEvent.signInViaGoogle(),
    );
  }

  void onAuthWithApple() {
    context.read<AuthBloc>().add(
      AuthEvent.signInViaApple(),
    );
  }

  void onRegister() {
    RegisterPageRoute().push(
      context,
    );
  }

  void onLogin() {
    LoginPageRoute().push(
      context,
    );
  }

  void onTapPrivacyPolicy() {
    PrivacyPolicyPageRoute().push(
      context,
    );
  }

  void onTapTermsOfUse() {
    TermsOfUsePageRoute().push(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    final linkStyle = textTheme.bold14.copyWith(
      color: AppColors.black.value,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.black.value,
    );

    return BuildAnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Stack(
              children: [
                HorizontalPadding(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.app_title,
                          textAlign: TextAlign.center,
                          style: textTheme.bold32.copyWith(
                            color: AppColors.white.value,
                          ),
                        ),
                        Gap(8.0),
                        Text(
                          AppLocalizations.of(context)!.auth_welcome,
                          textAlign: TextAlign.center,
                          style: textTheme.medium16.copyWith(
                            color: AppColors.white.value,
                          ),
                        ),
                        Gap(32.0),
                        if (state.status == AuthStatus.failed) ...[
                          ErrorMessageWidget(message: state.errorMessage),
                          Gap(20.0),
                        ],
                        // if (!kIsWeb && Platform.isIOS) ...[
                          ActionBtn(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                            onPressed: onAuthWithApple,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.apple,
                                  width: 20.0,
                                  height: 20.0,
                                  colorFilter: ColorFilter.mode(
                                    colorScheme.onSecondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap(10.0),
                                Text(
                                  AppLocalizations.of(context)!.auth_continue_with_apple,
                                  style: textTheme.medium16.copyWith(
                                    color: colorScheme.onSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(12.0),
                        // ],
                        if (kIsWeb)
                          Center(
                            child: getIt<GoogleSignInService>().renderButton(),
                          )
                        else
                          ActionBtn(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                            onPressed: onAuthWithGoogle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.google,
                                  width: 20.0,
                                  height: 20.0,
                                  colorFilter: ColorFilter.mode(
                                    colorScheme.onSecondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap(10.0),
                                Text(
                                  AppLocalizations.of(context)!.auth_continue_with_google,
                                  style: textTheme.medium16.copyWith(
                                    color: colorScheme.onSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Gap(24.0),
                        OrDivider(),
                        Gap(24.0),
                        Row(
                          children: [
                            Expanded(
                              child: ActionBtn(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 20.0,
                                ),
                                onPressed: onLogin,
                                child: Text(
                                  AppLocalizations.of(context)!.auth_login,
                                  style: textTheme.medium16.copyWith(
                                    color: colorScheme.onSecondary,
                                  ),
                                ),
                              ),
                            ),
                            Gap(12.0),
                            Expanded(
                              child: ActionBtn(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 20.0,
                                ),
                                onPressed: onRegister,
                                child: Text(
                                  AppLocalizations.of(context)!.auth_register,
                                  style: textTheme.medium16.copyWith(
                                    color: colorScheme.onSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(24.0),
                        Text.rich(
                          TextSpan(
                            style: textTheme.regular14.copyWith(
                              color: AppColors.white.value,
                            ),
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.auth_agreement_prefix,
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.auth_agreement_terms,
                                style: linkStyle,
                                recognizer: _termsRecognizer,
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.auth_agreement_and,
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.privacy_policy,
                                style: linkStyle,
                                recognizer: _privacyRecognizer,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(24.0),
                        // FutureBuilder(
                        //   future: PlatformHelper.getAppVersion(),
                        //   builder: (context, asyncSnapshot) {
                        //     return Text('Version ${asyncSnapshot.data ?? 1}');
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                if (state.status == AuthStatus.loading) LoadingDataWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
