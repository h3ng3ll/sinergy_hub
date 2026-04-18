import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';


import '../register_page/widgets/inputs/email_input.dart';
import 'bloc/reset_password_page/reset_password_page_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
 late final ResetPasswordPageBloc _resetPasswordPageBloc ;
  late final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _resetPasswordPageBloc = getIt<ResetPasswordPageBloc>();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _resetPasswordPageBloc.close();
    super.dispose();
  }

  void reset() {
    if (!_formKey.currentState!.validate()) return;
    FocusManager.instance.primaryFocus?.unfocus();
    _resetPasswordPageBloc.add(
      ResetPasswordPageEvent.reset(
        email: _emailController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BuildAnimatedBackground(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: BlocListener<ResetPasswordPageBloc, ResetPasswordPageState>(
          bloc: _resetPasswordPageBloc,
          listener: (context, state) {
            if (state.isFailed) {
              UiMessageService.showError(
                state.errorMessage,
              );
            } else if (state.isEmailSent) {
              UiMessageService.showInfo(
                'Reset mail instruction has been sent to provided email address',
                timeInSecondsDuration: 10,
              );

            }
          },
          child: BlocBuilder<ResetPasswordPageBloc, ResetPasswordPageState>(
            bloc: _resetPasswordPageBloc,
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
                              'Reset Password',
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
                          ActionBtn(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                            onPressed: reset,
                            child: Text(
                              'Reset',
                              style: textTheme.medium16.copyWith(
                                color: colorScheme.onSecondary,
                              ),
                            ),
                          ),
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
