import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil? _instance;

  ScreenUtil._();

  static ScreenUtil get instance {
    if (_instance == null) {
      _instance = ScreenUtil._();
    }

    return _instance!;
  }

  void init(MediaQueryData data) {
    screenWidth = data.size.width;
    screenHeight = data.size.height;
    pixelRatio = data.devicePixelRatio;
    statusBarHeight = data.padding.top;
    bottomBarHeight = data.padding.bottom;
  }

  late double screenWidth;
  late double screenHeight;
  late double pixelRatio;
  late double statusBarHeight;
  late double bottomBarHeight;
}
