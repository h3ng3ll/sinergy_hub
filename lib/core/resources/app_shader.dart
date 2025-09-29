import 'dart:ui' as ui;

abstract class AppShaders {
  static const String _base = 'assets/shaders/';
  static const String _ext = '.frag';

  static const backgroundGradient = '${_base}background_gradient$_ext';
  static const notificationPulse = '${_base}notification_pulse$_ext';
  static const myShader = '${_base}my_shader$_ext';
}

class FragmentProgramManager {
  static final Map<String, ui.FragmentProgram> _programs =
      <String, ui.FragmentProgram>{};

  static Future<void> initialize(String assetKey) async {
    if (!_programs.containsKey(assetKey)) {
      final ui.FragmentProgram program = await ui.FragmentProgram.fromAsset(
        assetKey,
      );
      _programs.putIfAbsent(
        assetKey,
        () => program,
      );
    }
  }

  static ui.FragmentProgram lookup(
    String assetKey,
  ) =>
      _programs[assetKey]!;
}
