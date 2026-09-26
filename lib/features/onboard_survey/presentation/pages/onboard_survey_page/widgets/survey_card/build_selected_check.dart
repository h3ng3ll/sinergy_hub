import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../../../../../../core/resources/app_shader.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';

class BuildSelectedCheck extends StatefulWidget {
  final double? width;
  final double? height;
  final double? checkSize;

  const BuildSelectedCheck({
    super.key,
    this.width,
    this.height,
    this.checkSize,
  });

  @override
  State<BuildSelectedCheck> createState() => _BuildSelectedCheckState();
}

class _BuildSelectedCheckState extends State<BuildSelectedCheck>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
            vsync: this,
            duration: Duration(
              seconds: 4,
            ),
          )
          ..repeat(
            reverse: true,
          )
          ..addListener(
            () => setState(() {}),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Size(
      widget.width ?? 50.0,
      widget.height ?? 50.0,
    );
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ShaderBuilder(
        (context, shader, child) {
          return CustomPaint(
            size: size,
            painter: _ShaderBuildSelectedCheckPainter(
              shader: shader,
              controller: _controller,
            ),
            child: child,
          );
        },
        assetKey: AppShaders.checkPulse,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: AppColors.white.value,
              size: widget.checkSize ?? 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShaderBuildSelectedCheckPainter extends CustomPainter {
  final FragmentShader shader;
  final AnimationController controller;

  const _ShaderBuildSelectedCheckPainter({
    super.repaint,
    required this.shader,
    required this.controller,
  });

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(
      0,
      size.width,
    );

    shader.setFloat(
      1,
      size.height,
    );
    shader.setFloat(
      2,
      controller.lastElapsedDuration!.inMilliseconds / 1000,
    );
    canvas.drawRect(
      Offset.zero & size,
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) => false;
}
