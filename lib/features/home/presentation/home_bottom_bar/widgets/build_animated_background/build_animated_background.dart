import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../../../../../core/resources/app_shader.dart';
import '../../../../../../core/utils/shader_painter.dart';

class BuildAnimatedBackground extends StatefulWidget {
  final Widget child;

  const BuildAnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<BuildAnimatedBackground> createState() =>
      _BuildAnimatedBackgroundState();
}

class _BuildAnimatedBackgroundState extends State<BuildAnimatedBackground>
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

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
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
      child: widget.child,
    );
  }
}
