import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

const Duration _kIconDownloadTimeout = Duration(seconds: 10);
const String _kIconCacheFolder = 'notification_icons';

class NotificationIconHelper {
  /// Resolves a remote image (e.g. the sender avatar) to a local file path,
  /// since notification icons/attachments need one. The download is cached
  /// on disk by URL, so the same image is fetched only once.
  ///
  /// iOS moves an attachment file into its own store, so on iOS a unique copy
  /// of the cached file is returned to keep the cache intact.
  ///
  /// Returns null on any failure, so the notification is still shown, just
  /// without an icon.
  static Future<String?> getLocalPath(String url) async {
    try {
      final cached = await _getOrDownload(url);
      if (cached == null) return null;

      if (Platform.isIOS) {
        final tempDir = await getTemporaryDirectory();
        final copy = await cached.copy(
          '${tempDir.path}/notif_${DateTime.now().microsecondsSinceEpoch}'
          '${_extension(url)}',
        );
        return copy.path;
      }
      return cached.path;
    } catch (e) {
      debugPrint('Notification icon resolve failed: $e');
      return null;
    }
  }

  static Future<File?> _getOrDownload(String url) async {
    final cacheDir = Directory(
      '${(await getApplicationCacheDirectory()).path}/$_kIconCacheFolder',
    );
    final file = File(
      '${cacheDir.path}/${md5.convert(utf8.encode(url))}${_extension(url)}',
    );

    if (await file.exists() && await file.length() > 0) {
      return file;
    }

    final response = await Dio().get<List<int>>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        receiveTimeout: _kIconDownloadTimeout,
      ),
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) return null;

    await cacheDir.create(recursive: true);
    return file.writeAsBytes(bytes);
  }

  static String _extension(String url) {
    final segments = Uri.parse(url).pathSegments;
    final lastSegment = segments.isNotEmpty ? segments.last : '';
    final dotIndex = lastSegment.lastIndexOf('.');
    return dotIndex != -1 ? lastSegment.substring(dotIndex) : '.jpg';
  }
}
