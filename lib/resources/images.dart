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
}
