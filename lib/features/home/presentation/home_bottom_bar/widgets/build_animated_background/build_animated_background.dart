import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../../../../../core/resources/app_shader.dart';

class BuildAnimatedBackground extends StatefulWidget {
  final Widget child;
  final BorderRadius? clipper;

  const BuildAnimatedBackground({
    super.key,
    required this.child,
    this.clipper,
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
        )..repeat(
          reverse: true,
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
          size: MediaQuery.of(context).size,
          painter: _ShaderBackgroundPainter(
            shader: shader,
            controller: _controller,
          ),
          // painter: ShaderPainter(
          //   repaint: _controller,
          //   shader: shader,
          //   parameters: [
          //     ShaderType(
          //       shaderType: EShaderDataType.floatShader,
          //       value: _controller.lastElapsedDuration!.inMilliseconds / 1000,
          //     ),
          //     ShaderType(
          //       shaderType: EShaderDataType.floatShader,
          //       value: width,
          //     ),
          //     ShaderType(
          //       shaderType: EShaderDataType.floatShader,
          //       value: height,
          //     ),
          //   ],
          // ),
          child: child,
        );
      },
      assetKey: AppShaders.ve,
      child: ClipRRect(
        borderRadius: widget.clipper ?? BorderRadius.zero,
        child: widget.child,
      ),
    );
  }
}

class _ShaderBackgroundPainter extends CustomPainter {
  final FragmentShader shader;
  final AnimationController controller;

  const _ShaderBackgroundPainter({
    super.repaint,
    required this.shader,
    required this.controller,
  });

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(
      0,
      controller.lastElapsedDuration!.inMilliseconds / 1000,
    );

    shader.setFloat(
      1,
      size.width,
    );
    shader.setFloat(
      2,
      size.height,
    );
    canvas.drawRect(
      Offset.zero & size,
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
