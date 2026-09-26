import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/app_shader.dart';

class BuildIcon extends StatefulWidget {
  final List<Color> colors;
  final String icon;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? iconColor;

  const BuildIcon({
    super.key,
    required this.colors,
    required this.icon,
    required this.width,
    required this.height,
    this.padding,
    this.borderRadius,
    this.iconColor,
  }) : assert(
         colors.length <= 2,
       );

  @override
  State<BuildIcon> createState() => _BuildIconState();
}

class _BuildIconState extends State<BuildIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(
            vsync: this,
            duration: Duration(
              seconds: 3,
            ),
          )
          ..repeat(
            reverse: true,
          )
          ..addListener(
            () => setState(() {}),
          );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          widget.borderRadius ??
          BorderRadius.circular(
            12.0,
          ),
      child: Container(
        width: widget.width,
        height: widget.height,

        decoration: BoxDecoration(
          color: widget.colors.length == 1 ? widget.colors.first : null,
        ),
        child: widget.colors.length == 1
            ? buildIcon()
            : ShaderBuilder(
                (context, shader, child) {
                  return CustomPaint(
                    painter: _ShaderIconPainter(
                      shader: shader,
                      controller: _animationController,
                      colors: widget.colors,
                    ),
                    child: child,
                  );
                },
                assetKey: AppShaders.gradientSmooth,
                child: buildIcon(),
              ),
      ),
    );
  }

  Widget buildIcon() {
    return Padding(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
      child: SvgPicture.asset(
        widget.icon,
        colorFilter: widget.iconColor != null
            ? ColorFilter.mode(
                widget.iconColor!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}

class _ShaderIconPainter extends CustomPainter {
  final FragmentShader shader;
  final AnimationController controller;
  final List<Color> colors;

  const _ShaderIconPainter({
    super.repaint,
    required this.shader,
    required this.controller,
    required this.colors,
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

    /// color1
    shader.setFloat(
      3,
      colors.first.r,
    );
    shader.setFloat(
      4,
      colors.first.g,
    );
    shader.setFloat(
      5,
      colors.first.b,
    );

    /// color2
    shader.setFloat(
      6,
      colors[1].r,
    );
    shader.setFloat(
      7,
      colors[1].g,
    );
    shader.setFloat(
      8,
      colors[1].b,
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
