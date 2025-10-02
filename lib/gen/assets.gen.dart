// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/analytic.svg
  String get analytic => 'assets/icons/analytic.svg';

  /// File path: assets/icons/community.svg
  String get community => 'assets/icons/community.svg';

  /// File path: assets/icons/pallete.svg
  String get pallete => 'assets/icons/pallete.svg';

  /// File path: assets/icons/psd-3d-render-rocket-ioslated-background.zip
  String get psd3dRenderRocketIoslatedBackground =>
      'assets/icons/psd-3d-render-rocket-ioslated-background.zip';

  /// File path: assets/icons/rocket-ship-half-shadow.zip
  String get rocketShipHalfShadow => 'assets/icons/rocket-ship-half-shadow.zip';

  /// File path: assets/icons/rocket.svg
  String get rocket => 'assets/icons/rocket.svg';

  /// File path: assets/icons/tool.svg
  String get tool => 'assets/icons/tool.svg';

  /// File path: assets/icons/work.svg
  String get work => 'assets/icons/work.svg';

  /// List of all assets
  List<String> get values => [
    analytic,
    community,
    pallete,
    psd3dRenderRocketIoslatedBackground,
    rocketShipHalfShadow,
    rocket,
    tool,
    work,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/3d-briefcase.png
  AssetGenImage get a3dBriefcase =>
      const AssetGenImage('assets/images/3d-briefcase.png');

  /// File path: assets/images/analysis.png
  AssetGenImage get analysis =>
      const AssetGenImage('assets/images/analysis.png');

  /// File path: assets/images/back_pattern.png
  AssetGenImage get backPattern =>
      const AssetGenImage('assets/images/back_pattern.png');

  /// File path: assets/images/group.png
  AssetGenImage get group => const AssetGenImage('assets/images/group.png');

  /// File path: assets/images/magic_pattern.png
  AssetGenImage get magicPattern =>
      const AssetGenImage('assets/images/magic_pattern.png');

  /// File path: assets/images/paint.png
  AssetGenImage get paint => const AssetGenImage('assets/images/paint.png');

  /// File path: assets/images/repair-tools.png
  AssetGenImage get repairTools =>
      const AssetGenImage('assets/images/repair-tools.png');

  /// File path: assets/images/rocket.png
  AssetGenImage get rocket => const AssetGenImage('assets/images/rocket.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    a3dBriefcase,
    analysis,
    backPattern,
    group,
    magicPattern,
    paint,
    repairTools,
    rocket,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
