import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../../../../../../../core/resources/app_shader.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';

/// Header widget for filter modal with animated gradient shader background.
class FilterHeader extends StatefulWidget {
  final VoidCallback onClose;

  const FilterHeader({
    super.key,
    required this.onClose,
  });

  @override
  State<FilterHeader> createState() => _FilterHeaderState();
}

class _FilterHeaderState extends State<FilterHeader> {
  ui.FragmentShader? _shader;

  @override
  void initState() {
    super.initState();
    _loadShader();
  }

  Future<void> _loadShader() async {
    try {
      final shader = await FragmentProgramManager.get(
        AppShaders.animatedGradient,
      );
      if (mounted) {
        setState(() {
          _shader = shader;
        });
      }
    } catch (e) {
      // Fallback to gradient if shader fails to load
      debugPrint('Failed to load shader: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return ShaderBuilder(
      shader: _shader,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ).copyWith(
          top: MediaQuery.of(context).padding.top + 16.0,
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Filters',
                  style: textTheme.semiBold24.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: widget.onClose,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget that renders a custom shader or falls back to a gradient.
class ShaderBuilder extends StatelessWidget {
  final ui.FragmentShader? shader;
  final Widget child;

  const ShaderBuilder({
    super.key,
    required this.shader,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (shader != null) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
        child: CustomPaint(
          painter: _ShaderPainter(shader!),
          child: child,
        ),
      );
    }
    return child;
  }
}

/// Fixed phase of the header gradient (the header is static).
const double _kHeaderShaderTime = 1.0;

class _ShaderPainter extends CustomPainter {
  final ui.FragmentShader shader;

  _ShaderPainter(this.shader);

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    /// `uTime` must always be set: an unset uniform is undefined on the GPU
    /// and intermittently renders the header solid black.
    shader.setFloat(2, _kHeaderShaderTime);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ShaderPainter oldDelegate) => false;
}
