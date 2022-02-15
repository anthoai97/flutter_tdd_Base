class ImageDef {
  static ImageDef? _instance;

  ImageDef._();

  static ImageDef get instance {
    if (_instance == null) {
      _instance = ImageDef._();
    }

    return _instance!;
  }

  final String splashGif = 'assets/images/splash_gif.gif';
  final String imageLoadingBlack = 'assets/images/img_loading_black.gif';
  final String imageLoadingWhite = 'assets/images/img_loading_white.gif';
  final String imageNoResult = 'assets/images/img_no_result.png';
  final String imageError = 'assets/images/img_error.png';
}
