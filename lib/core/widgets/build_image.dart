import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxShape shape;
  final Border? border;

  const BuildImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Placeholder();
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape,
        border: border,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            url!,
          ),
        ),
      ),
    );
  }
}
