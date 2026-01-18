import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

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
    if (url == null && cacheImg == null) {
      return Placeholder();
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape,
        border: border,
        borderRadius: borderRadius,
        image: url != null || cacheImg != null
            ? DecorationImage(
                fit: fit,
                image: cacheImg != null
                    ? MemoryImage(
                        cacheImg!,
                      )
                    : CachedNetworkImageProvider(
                        url!,
                      ),
              )
            : null,
      ),
    );
  }
}
