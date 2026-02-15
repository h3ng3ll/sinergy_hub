import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';
import 'build_image.dart';

class BuildUserAvatar extends StatelessWidget {
  final double? width;
  final double? height;
  final String? url;
  final Uint8List? cacheImg;
  final VoidCallback? onTap;

  const BuildUserAvatar({
    super.key,
    this.width,
    this.height,
    required this.url,
    this.onTap,
    this.cacheImg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 150.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: BuildImage(
          url: url,
          cacheImg: cacheImg,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.white.value,
            width: 3,
          ),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
