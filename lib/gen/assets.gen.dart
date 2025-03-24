/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/MPIcons.ttf
  String get mPIcons => 'assets/icon/MPIcons.ttf';

  /// List of all assets
  List<String> get values => [mPIcons];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/house.jpg
  AssetGenImage get house => const AssetGenImage('assets/images/house.jpg');

  /// File path: assets/images/house2.jpg
  AssetGenImage get house2 => const AssetGenImage('assets/images/house2.jpg');

  /// File path: assets/images/house3.jpg
  AssetGenImage get house3 => const AssetGenImage('assets/images/house3.jpg');

  /// File path: assets/images/house4.jpeg
  AssetGenImage get house4 => const AssetGenImage('assets/images/house4.jpeg');

  /// File path: assets/images/house5.jpg
  AssetGenImage get house5 => const AssetGenImage('assets/images/house5.jpg');

  /// File path: assets/images/house6.jpg
  AssetGenImage get house6 => const AssetGenImage('assets/images/house6.jpg');

  /// File path: assets/images/house7.jpeg
  AssetGenImage get house7 => const AssetGenImage('assets/images/house7.jpeg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [house, house2, house3, house4, house5, house6, house7, logo, map];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
