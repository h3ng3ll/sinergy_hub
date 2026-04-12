
import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformHelper {

  static  final isMobile = !kIsWeb && (Platform.isIOS || Platform.isAndroid);
}