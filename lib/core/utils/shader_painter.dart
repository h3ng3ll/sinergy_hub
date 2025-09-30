import 'dart:ui';

import 'package:flutter/cupertino.dart';

enum EShaderDataType { floatShader }

class ShaderType {
  final EShaderDataType shaderType;
  final dynamic value;

  ShaderType({required this.shaderType, required this.value});
}

class ShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final List<ShaderType> parameters;

  const ShaderPainter({
    super.repaint,
    required this.shader,
    required this.parameters,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < parameters.length; i++) {
      final parameter = parameters[i];
      switch (parameter.shaderType) {
        case EShaderDataType.floatShader:
          shader.setFloat(
            i,
            parameter.value,
          );
      }
    }
    // shader.setFloat(0, size.width);
    // shader.setFloat(1, size.height);
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
