import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../../../../../core/resources/app_shader.dart';
import 'background_scope.dart';
import '../../../../../appearance/domain/models/background_palette/background_palette.dart';
import '../../../../../appearance/presentation/bloc/background_palette_bloc/background_palette_bloc.dart';

/// Every `ve.frag` time frequency (0.5, 0.3, 0.4, 0.2) is a multiple of 0.1,
/// so the gradient repeats exactly every 20π seconds. Wrapping time to this
/// period keeps the loop seamless and the float small for mediump precision.
const double _kShaderPeriod = 20 * pi;

/// One clock for the whole app, so the gradient phase continues across pages
/// instead of restarting from zero on each new background instance.
final Stopwatch _clock = Stopwatch()..start();

double _shaderTime() =>
    (_clock.elapsedMicroseconds / Duration.microsecondsPerSecond) %
    _kShaderPeriod;

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
  final ValueNotifier<double> _time = ValueNotifier(_shaderTime());
  late final Ticker _ticker;

  @override
  void initState() {
    _ticker = createTicker(_onTick)..start();
    super.initState();
  }

  void _onTick(Duration _) {
    _time.value = _shaderTime();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// A responsive shell above already paints the full-screen background:
    /// pass through (keeping the clip) and re-enable painting for descendants.
    if (BackgroundScope.isActive(context)) {
      return ClipRRect(
        borderRadius: widget.clipper ?? BorderRadius.zero,
        child: BackgroundScope(
          active: false,
          child: widget.child,
        ),
      );
    }

    /// Only the applied palette is selected (freezed equality), so unrelated
    /// palette-bloc emissions never rebuild the background.
    final palette = context.select<BackgroundPaletteBloc, BackgroundPalette?>(
      (bloc) => bloc.state.effectivePalette,
    );
    final colors = palette?.shaderColors ?? kDefaultBackgroundShaderColors;

    return ShaderBuilder(
      (context, shader, child) {
        return RepaintBoundary(
          child: CustomPaint(
            painter: _ShaderBackgroundPainter(
              shader: shader,
              time: _time,
              colors: colors,
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
          ),
        );
      },
      assetKey: AppShaders.ve,
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: widget.clipper ?? BorderRadius.zero,
          child: widget.child,
        ),
      ),
    );
  }
}

class _ShaderBackgroundPainter extends CustomPainter {
  final FragmentShader shader;
  final ValueNotifier<double> time;

  /// The 4 `uColor1..4` uniforms, in order.
  final List<Color> colors;

  _ShaderBackgroundPainter({
    required this.shader,
    required this.time,
    required this.colors,
  }) : super(repaint: time);

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(
      0,
      time.value,
    );

    shader.setFloat(
      1,
      size.width,
    );
    shader.setFloat(
      2,
      size.height,
    );

    /// Floats 3..14: `uColor1..uColor4` as normalized r, g, b.
    var index = 3;
    for (final color in colors) {
      shader
        ..setFloat(index++, color.r)
        ..setFloat(index++, color.g)
        ..setFloat(index++, color.b);
    }
    canvas.drawRect(
      Offset.zero & size,
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant _ShaderBackgroundPainter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.time != time ||
      !listEquals(oldDelegate.colors, colors);
}
