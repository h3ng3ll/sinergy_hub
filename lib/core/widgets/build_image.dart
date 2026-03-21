import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../resources/colors/app_color_scheme.dart';
import '../resources/colors/app_colors.dart';

class BuildImage extends StatelessWidget {
  final Uint8List? cacheImg;
  final String? img;
  final BoxShape shape;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Border? border;
  final String? url;

  const BuildImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.border,
    this.cacheImg,
    this.img,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    if (url == null && cacheImg == null) {
      return Center(
        child: SvgPicture.asset(
          Assets.icons.user,
          width: 40.0,
          height: 40.0,
          colorFilter: ColorFilter.mode(
            colorScheme.onPrimary.withValues(
              alpha: 0.6,
            ),
            BlendMode.srcIn,
          ),
        ),
      );
    // return Container(
    //   width: width,
    //   height: height,
    //
    //   decoration: BoxDecoration(
    //     borderRadius: borderRadius,
    //     color: AppColors.antiFlashWhite.value,
    //   ),
    //   child: Center(
    //     child: SvgPicture.asset(
    //       Assets.icons.user,
    //       width: width != null ? width! * 0.5 : null,
    //       height: height != null ? height! * 0.5 : null,
    //       colorFilter: ColorFilter.mode(
    //         AppColors.jacarta.value,
    //         BlendMode.srcIn,
    //       ),
    //     ),
    //   ),
    // );
    }

    if (shape == BoxShape.circle) {
    return ClipOval(
    child: Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    border: border,
    image: url != null || cacheImg != null
    ? DecorationImage(
    fit: fit,
    image: cacheImg != null
    ? MemoryImage(cacheImg!)
        : CachedNetworkImageProvider(url!),
    )
        : null,
    ),
    ),
    );
    }

    if (borderRadius != null) {
    return ClipRRect(
    borderRadius: borderRadius!,
    child: Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    border: border,
    image: url != null || cacheImg != null
    ? DecorationImage(
    fit: fit,
    image: cacheImg != null
    ? MemoryImage(cacheImg!)
        : CachedNetworkImageProvider(url!),
    )
        : null,
    ),
    ),
    );
    }

    return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    border: border,
    image: url != null || cacheImg != null
    ? DecorationImage(
    fit: fit,
    image: cacheImg != null
    ? MemoryImage(cacheImg!)
        : CachedNetworkImageProvider(url!),
    )
        : null,
    ),
    );
  }
}
