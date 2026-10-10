import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../resources/colors/app_color_scheme.dart';

class BuildImage extends StatelessWidget {
  final String? url;
  final Uint8List? bytes;
  final String? asset;
  final double? width;
  final double? height;

  final BoxShape shape;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? placeholderColor;

  const BuildImage({
    super.key,
    this.url,
    this.bytes,
    this.asset,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.border,
    this.placeholderColor,
  });

  bool get _hasImage => url != null || bytes != null || asset != null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    if (!_hasImage) {
      return _placeholder(colorScheme);
    }

    Widget image;

    if (bytes != null) {
      image = Image.memory(bytes!, fit: fit);
    } else if (asset != null) {
      image = Image.asset(asset!, fit: fit);
    } else {
      image = CachedNetworkImage(
        imageUrl: url!,
        fit: fit,
        placeholder: (context, _) => _loading(),
        errorWidget: (context, _, _) => _placeholder(colorScheme),
      );
    }

    return _wrap(image);
  }

  Widget _wrap(Widget child) {
    Widget result = child;

    if (shape == BoxShape.circle) {
      result = ClipOval(child: result);
    }

    if (borderRadius != null) {
      result = ClipRRect(borderRadius: borderRadius!, child: result);
    }

    return SizedBox(
      width: width,
      height: height,
      child: Container(
        foregroundDecoration: BoxDecoration(
          border: border,
          shape: shape,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
        ),
        child: result,
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _placeholder(AppColorScheme colorScheme) {
    return Center(
      child: SvgPicture.asset(
        Assets.icons.user,
        width: 40,
        height: 40,
        colorFilter: ColorFilter.mode(
          placeholderColor ?? colorScheme.onPrimary.withValues(alpha: 0.6),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}