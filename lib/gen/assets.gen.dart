/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/blue_pen_icon.png
  AssetGenImage get bluePenIcon =>
      const AssetGenImage('assets/icons/blue_pen_icon.png');

  /// File path: assets/icons/eye.png
  AssetGenImage get eye => const AssetGenImage('assets/icons/eye.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/write.png
  AssetGenImage get write => const AssetGenImage('assets/icons/write.png');

  /// List of all assets
  List<AssetGenImage> get values => [bluePenIcon, eye, home, user, write];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/audiofile_icon.png
  AssetGenImage get audiofileIcon =>
      const AssetGenImage('assets/images/audiofile_icon.png');

  /// File path: assets/images/blue_pen_icon.png
  AssetGenImage get bluePenIcon =>
      const AssetGenImage('assets/images/blue_pen_icon.png');

  /// File path: assets/images/down-up-arrow-svg.svg
  String get downUpArrowSvg => 'assets/images/down-up-arrow-svg.svg';

  /// File path: assets/images/down_cat_arrow_icon.png
  AssetGenImage get downCatArrowIcon =>
      const AssetGenImage('assets/images/down_cat_arrow_icon.png');

  /// File path: assets/images/down_square_svg.svg
  String get downSquareSvg => 'assets/images/down_square_svg.svg';

  /// File path: assets/images/empty_state.png
  AssetGenImage get emptyState =>
      const AssetGenImage('assets/images/empty_state.png');

  /// File path: assets/images/hashtag_icon.png
  AssetGenImage get hashtagIcon =>
      const AssetGenImage('assets/images/hashtag_icon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/microphon_icon.png
  AssetGenImage get microphonIcon =>
      const AssetGenImage('assets/images/microphon_icon.png');

  /// File path: assets/images/poster_test.png
  AssetGenImage get posterTest =>
      const AssetGenImage('assets/images/poster_test.png');

  /// File path: assets/images/profileAvatar.png
  AssetGenImage get profileAvatar =>
      const AssetGenImage('assets/images/profileAvatar.png');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// File path: assets/images/tcbot.svg
  String get tcbot => 'assets/images/tcbot.svg';

  /// File path: assets/images/techbot_sad.svg
  String get techbotSad => 'assets/images/techbot_sad.svg';

  /// File path: assets/images/write_article_icon.png
  AssetGenImage get writeArticleIcon =>
      const AssetGenImage('assets/images/write_article_icon.png');

  /// File path: assets/images/write_microphone_icon.png
  AssetGenImage get writeMicrophoneIcon =>
      const AssetGenImage('assets/images/write_microphone_icon.png');

  /// File path: assets/images/write_podcast_icon.png
  AssetGenImage get writePodcastIcon =>
      const AssetGenImage('assets/images/write_podcast_icon.png');

  /// List of all assets
  List<dynamic> get values => [
        audiofileIcon,
        bluePenIcon,
        downUpArrowSvg,
        downCatArrowIcon,
        downSquareSvg,
        emptyState,
        hashtagIcon,
        logo,
        microphonIcon,
        posterTest,
        profileAvatar,
        singlePlaceHolder,
        tcbot,
        techbotSad,
        writeArticleIcon,
        writeMicrophoneIcon,
        writePodcastIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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
