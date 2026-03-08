import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../../../../../core/resources/app_shader.dart';
import '../../../../../../core/utils/shader_painter.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 100000, // Very long duration for smooth continuous animation
      ),
    )
      ..repeat()
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
                shaderType: EShaderDataType.float2Shader,
                value: [
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height,
                ],
              ),
              ShaderType(
                shaderType: EShaderDataType.floatShader,
                value: _controller.lastElapsedDuration!.inMilliseconds / 1000,
              ),
            ],
          ),
          child: child,
        );
      },
      assetKey: AppShaders.animatedGradient,
      child: widget.child,
    );
  }
}