
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PlatformHelper {

  static  final isMobile = !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version}  +${info.buildNumber}';
  }
}