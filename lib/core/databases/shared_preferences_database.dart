import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDatabase {
  SharedPreferences? _p;

  Future<SharedPreferences> _prefs() async {
    _p ??= await SharedPreferences.getInstance();
    return _p!;
  }

  Future<bool> setValue(String key, dynamic value) async {
    final p = await _prefs();
    if (value is String) {
      return p.setString(key, value);
    } else if (value is int) {
      return p.setInt(key, value);
    } else if (value is bool) {
      return p.setBool(key, value);
    } else if (value is double) {
      return p.setDouble(key, value);
    } else if (value is List<String>) {
      return p.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  dynamic getValue(String key) async {
    final p = await _prefs();
    return p.get(key);
  }

  /// Remove by key
  Future<bool> remove(String key) async {
    final p = await _prefs();
    return p.remove(key);
  }

  /// Remove all
  Future<bool> clear() async {
    final p = await _prefs();
    return p.clear();
  }
}
