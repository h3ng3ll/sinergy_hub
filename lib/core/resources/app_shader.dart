import 'dart:ui' as ui;

abstract class AppShaders {
  static const String _base = 'shaders/';
  static const String _ext = '.frag';

  static const simple = '${_base}simple$_ext';
  static const ve = '${_base}ve$_ext';
  static const myShader = '${_base}my_shader$_ext';
}


class FragmentProgramManager {
  static final Map<String, ui.FragmentProgram> _programs =
      <String, ui.FragmentProgram>{};

  static Future<ui.FragmentShader> get(String assetKey) async {
    if (!_programs.containsKey(assetKey)) {
      final ui.FragmentProgram program = await ui.FragmentProgram.fromAsset(
        assetKey,
      );
      _programs.putIfAbsent(
        assetKey,
        () => program,
      );
    }
    final program = _lookup(assetKey);
    return program.fragmentShader();
  }

  static ui.FragmentProgram _lookup(
    String assetKey,
  ) =>
      _programs[assetKey]!;
}
