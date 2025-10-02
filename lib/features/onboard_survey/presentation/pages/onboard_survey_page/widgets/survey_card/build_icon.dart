import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/app_shader.dart';
import '../../../../../../../core/utils/shader_painter.dart';

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
                    painter: ShaderPainter(
                      repaint: _animationController,
                      shader: shader,
                      parameters: [
                        /// resolution
                        ShaderType(
                          shaderType: EShaderDataType.float2Shader,
                          value: [
                            widget.width,
                            widget.height,
                          ],
                        ),

                        /// time
                        ShaderType(
                          shaderType: EShaderDataType.floatShader,
                          value:
                              _animationController
                                  .lastElapsedDuration!
                                  .inMilliseconds /
                              1000,
                        ),

                        /// color1
                        ShaderType(
                          shaderType: EShaderDataType.float3Shader,
                          value: [
                            widget.colors.first.r,
                            widget.colors.first.g,
                            widget.colors.first.b,
                          ],
                        ),

                        /// color2
                        ShaderType(
                          shaderType: EShaderDataType.float3Shader,
                          value: [
                            widget.colors[1].r,
                            widget.colors[1].g,
                            widget.colors[1].b,
                          ],
                        ),
                      ],
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
