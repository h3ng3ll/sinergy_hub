import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/error_message_widget.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  void onAuthWithGoogle() {
    context.read<AuthBloc>().add(
      AuthEvent.signInViaGoogle(),
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

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
                      children: [
                        if (state.status == AuthStatus.failed)
                          ErrorMessageWidget(message: state.errorMessage),
                        Gap(24.0),
                        TextButton(
                          onPressed: onRegister,
                          child: Text(
                            'Register',
                            style: textTheme.medium16.copyWith(
                              color: AppColors.white.value,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: onLogin,
                          child: Text(
                            'Login',
                            style: textTheme.medium16.copyWith(
                              color: AppColors.white.value,
                            ),
                          ),
                        ),
                        if (kIsWeb)
                          getIt<GoogleSignInService>().renderButton()
                        else
                          ActionBtn(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                            onPressed: onAuthWithGoogle,
                            child: Text(
                              'SIGN IN WITH GOOGLE',
                              style: textTheme.medium16.copyWith(
                                color: colorScheme.onSecondary,
                              ),
                            ),
                          ),
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
