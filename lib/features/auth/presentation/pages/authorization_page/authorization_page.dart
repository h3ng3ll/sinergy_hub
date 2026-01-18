import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/app_shader.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/error_message_widget.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/utils/shader_painter.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../domain/repostories/i_auth_repository.dart';
import '../../bloc/auth_cubit/auth_cubit.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final isAuthorized = await context.read<AuthCubit>().isAuthorized();
        if (isAuthorized && mounted) {
          OnboardSurveyPageRoute().go(
            context,
          );
        }
      },
    );

    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(
              seconds: 5,
            ),
          )
          ..repeat(
            reverse: true,
          )
          ..addListener(
            () {
              if (mounted) {
                setState(() {});
              }
            },
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> onAuthWithGoogle(BuildContext context) async {
    await context.read<AuthCubit>().signInViaGoogle();
    if (!context.mounted) return;
    OnboardSurveyPageRoute().go(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              ShaderBuilder(
                (context, shader, child) {
                  return CustomPaint(
                    painter: ShaderPainter(
                      repaint: _controller,
                      shader: shader,
                      parameters: [
                        ShaderType(
                          shaderType: EShaderDataType.floatShader,
                          value:
                              _controller
                                  .lastElapsedDuration!
                                  .inMilliseconds /
                              1000,
                        ),
                        ShaderType(
                          shaderType: EShaderDataType.floatShader,
                          value: MediaQuery.of(context).size.width,
                        ),
                        ShaderType(
                          shaderType: EShaderDataType.floatShader,
                          value: MediaQuery.of(context).size.height,
                        ),
                      ],
                    ),
                    child: HorizontalPadding(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.status == AuthStatus.failed)
                              ErrorMessageWidget(message: state.errorMessage),
                            Gap(24.0),
                            ActionBtn(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 20.0,
                              ),
                              onPressed: () => onAuthWithGoogle(context),
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
                  );
                },
                assetKey: AppShaders.ve,
              ),
              if (state.status == AuthStatus.loading) LoadingDataWidget(),
            ],
          );
        },
      ),
    );
  }
}
