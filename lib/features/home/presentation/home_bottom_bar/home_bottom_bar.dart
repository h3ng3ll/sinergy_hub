import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/resources/app_shader.dart';
import '../../../../core/utils/shader_painter.dart';
import '../../../matches/domain/repositories/i_user_matching_repository.dart';
import '../../../matches/domain/usecases/create_user_matches_use_case.dart';
import '../../../matches/domain/usecases/get_user_matches_use_case.dart';
import '../../../matches/presentation/bloc/user_matching_cubit/user_matching_cubit.dart';
import '../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import 'widgets/custom_bottom_bar_container.dart';

class HomeBottomBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeBottomBar({
    super.key,
    required this.navigationShell,
  });

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
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

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goBranch(
    int index,
  ) => widget.navigationShell.goBranch(
    index,
    initialLocation: index == widget.navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserMatchingCubit(
        userCubit: context.read<UserCubit>(),
        getUserMatchesUseCase: getIt<GetUserMatchesUseCase>(),
        createUserMatchesUseCase: getIt<CreateUserMatchesUseCase>(),
      ),
      child: ShaderBuilder(
        (context, shader, child) {
          return CustomPaint(
            painter: ShaderPainter(
              repaint: _controller,
              shader: shader,
              parameters: [
                ShaderType(
                  shaderType: EShaderDataType.floatShader,
                  value: _controller.lastElapsedDuration!.inMilliseconds / 1000,
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
            child: child,
          );
        },
        assetKey: AppShaders.ve,
        child: Scaffold(
          body: widget.navigationShell,

          backgroundColor: Colors.transparent,
          bottomNavigationBar: CustomBottomBarContainer(
            selectedIndex: widget.navigationShell.currentIndex,
            onTapItem: _goBranch,
          ),
        ),
      ),
    );
  }
}
