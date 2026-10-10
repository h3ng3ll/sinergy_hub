import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'build_image.dart';

class BuildUserAvatar extends StatelessWidget {
  final double? width;
  final double? height;
  final String? url;
  final Uint8List? cacheImg;
  final VoidCallback? onTap;
  final Color? placeholderColor;

  const BuildUserAvatar({
    super.key,
    this.width,
    this.height,
    required this.url,
    this.onTap,
    this.cacheImg,
    this.placeholderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 150.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: BuildImage(
          url: url,
          bytes: cacheImg,
          shape: BoxShape.circle,
          width: width,
          height: height,
          placeholderColor: placeholderColor,
        ),
      ),
    );
  }
}
