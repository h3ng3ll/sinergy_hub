import 'dart:ui';

import 'package:flutter/cupertino.dart';

enum EShaderDataType {
  floatShader,
  float2Shader, // vec2
  float3Shader, // vec3
  float4Shader, // vec4
}

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
    int index = 0;
    for (final parameter in parameters) {
      switch (parameter.shaderType) {
        case EShaderDataType.floatShader:
          shader.setFloat(index, parameter.value as double);
          index += 1;
          break;

        case EShaderDataType.float2Shader:
          final v = parameter.value as List<double>;
          shader.setFloat(index, v[0]);
          shader.setFloat(index + 1, v[1]);
          index += 2;
          break;

        case EShaderDataType.float3Shader:
          final v = parameter.value as List<double>;
          shader.setFloat(index, v[0]);
          shader.setFloat(index + 1, v[1]);
          shader.setFloat(index + 2, v[2]);
          index += 3;
          break;

        case EShaderDataType.float4Shader:
          final v = parameter.value as List<double>;
          shader.setFloat(index, v[0]);
          shader.setFloat(index + 1, v[1]);
          shader.setFloat(index + 2, v[2]);
          shader.setFloat(index + 3, v[3]);
          index += 4;
          break;
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
