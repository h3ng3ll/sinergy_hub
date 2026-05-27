import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'ui_message_service.dart';

class PermissionRequester {
  bool isPicking = false;

  Future<File?> onPickGallery(BuildContext context) async {
    if (isPicking) return null;
    isPicking = true;

    try {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 32) {
          await Permission.storage.request();
        } else {
          await Permission.photos.request();
        }
      }

      final res = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (res == null) return null;
      isPicking = false;
      return File(
        res.path,
      );
    } catch (_) {
      UiMessageService.showError(
        'Failed to pick image from gallery',
      );
    } finally {
      isPicking = false;
    }
    return null;
  }

  Future<File?> onPickCamera(BuildContext context) async {
    if (isPicking) return null;
    isPicking = true;

    try {
      final cameraStatus = await Permission.camera.request();
      if (!context.mounted) return null;

      if (cameraStatus.isGranted) {
        final res = await ImagePicker().pickImage(
          source: ImageSource.camera,
        );
        if (res == null) return null;
        isPicking = false;
        return File(
          res.path,
        );
      } else {
        UiMessageService.showSuccess(
          'Please grant camera access',
        );
        await Future.delayed(
          Duration(seconds: 2),
        );
        // openAppSettings();
      }
    } catch (_) {
      UiMessageService.showError(
        'Failed to pick image from camera',
      );
    } finally {
      isPicking = false;
    }

    return null;
  }
}
