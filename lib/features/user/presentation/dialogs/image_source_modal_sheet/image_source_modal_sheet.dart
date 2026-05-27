import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/permission_requester_service.dart';
import 'widgets/image_source_divider.dart';
import 'widgets/image_source_grab_handle.dart';
import 'widgets/image_source_option_row.dart';

class ImageSourceModalSheet extends StatelessWidget {
  const ImageSourceModalSheet({super.key});

  static Future<Uint8List?> show() {
    final rootContext = RootPageRoute.rootKey.currentContext;
    if (rootContext == null) return Future.value(null);
    return showModalBottomSheet<Uint8List?>(
      context: rootContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ImageSourceModalSheet(),
    );
  }

  Future<void> _onPickCamera(BuildContext context) async {
    final file = await getIt<PermissionRequester>().onPickCamera(
      context,
    );
    if (file == null) {
      if (!context.mounted) return;
      Navigator.pop(context);
      return;
    }
    final bytes = await file.readAsBytes();
    if (!context.mounted) return;
    Navigator.pop(context, bytes);
  }

  Future<void> _onPickGallery(BuildContext context) async {
    final file = await getIt<PermissionRequester>().onPickGallery(
      context,
    );
    if (file == null) {
      if (!context.mounted) return;
      Navigator.pop(context);
      return;
    }
    final bytes = await file.readAsBytes();
    if (!context.mounted) return;
    Navigator.pop(context, bytes);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pinkLace.value,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(12.0),
          const ImageSourceGrabHandle(),
          const Gap(8.0),
          ImageSourceOptionRow(
            icon: Icons.camera_alt_outlined,
            label: 'Take a photo',
            onTap: () => _onPickCamera(context),
          ),
          const ImageSourceDivider(),
          ImageSourceOptionRow(
            icon: Icons.photo_library_outlined,
            label: 'Choose from gallery',
            onTap: () => _onPickGallery(context),
          ),

          Gap(12.0 + bottom),
        ],
      ),
    );
  }
}
