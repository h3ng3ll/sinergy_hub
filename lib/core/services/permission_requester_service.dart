import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ui_message_service.dart';

class PermissionRequester {
  bool isPicking = false;



  Future<File?> onPickGallery(BuildContext context) async {
    if (isPicking) return null;
    isPicking = true;

    try {
      final photoStatus = await Permission.photos.request();

      if (photoStatus.isLimited) {
        UiMessageService.showSuccess(
          'Please grant full access to photos',
        );
        await Future.delayed(
          Duration(seconds: 2),
        );
        openAppSettings();
      } else if (photoStatus.isGranted) {
        if (!context.mounted) return null;
        final res = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (res == null) return null;
        isPicking = false;
        return File(
          res.path,
        );
      } else {
        openAppSettings();
      }
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
        openAppSettings();
      }
    } catch (_) {
      UiMessageService.showError(
        'Failed to pick image from camera',
      );
    }finally {
      isPicking = false;
    }

    return null;
  }
}
