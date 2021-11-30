import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorsDef {
  static const Color facebookBackgroundColor = Color.fromRGBO(66, 103, 178, 1);
  static const Color googleBackgroundColor = Color.fromRGBO(51, 103, 214, 1);
  static const Color appleBtnLoginBackgroundColor =
      Color.fromRGBO(17, 17, 17, 1);

  static const Color themeLightBGColor = Color.fromRGBO(239, 239, 241, 1.0);
  static const Color themeTextBlackColor = Colors.black;
  static const Color themeTextGrayColor = Colors.black45;

  static const Color kPrimaryColor = Colors.black;
  static const Color kPrimaryLightColor = Colors.black12;

  static const Color color_transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color color_black = Color.fromRGBO(0, 0, 0, 1);
  static const Color color_0C0D0E = Color.fromRGBO(12, 13, 14, 1);
  static const Color color_black_0F1317 = Color.fromRGBO(15, 19, 23, 1);
  static const Color color_white = Color.fromRGBO(255, 255, 255, 1);
  static const Color color_FAFAFA = Color.fromRGBO(250, 250, 250, 1);
  static const Color color_F9F9F9 = Color.fromRGBO(249, 249, 249, 1);
  static const Color color_F8F8F8 = Color.fromRGBO(248, 248, 248, 1);
  static const Color color_F4F4F4 = Color.fromRGBO(244, 244, 244, 1);
  static const Color color_F2F2F3 = Color.fromRGBO(242, 242, 243, 1);
  static const Color color_E7E9EC = Color.fromRGBO(231, 233, 236, 1);
  static const Color color_E2E2E4 = Color.fromRGBO(226, 226, 228, 1);
  static const Color color_D1D5DB = Color.fromRGBO(209, 213, 219, 1);
  static const Color color_CDCDCD = Color.fromRGBO(205, 205, 205, 1);
  static const Color color_ACACAC = Color.fromRGBO(172, 172, 172, 1);
  static const Color color_888888 = Color.fromRGBO(136, 136, 136, 1);
  static const Color color_626262 = Color.fromRGBO(98, 98, 98, 1);
  static const Color color_555555 = Color.fromRGBO(85, 85, 85, 1);
  static const Color color_FDF9F1 = Color.fromRGBO(253, 249, 241, 1);
  static const Color color_F2BA44 = Color.fromRGBO(242, 186, 68, 1);
  static const Color color_FF9900 = Color.fromRGBO(255, 153, 0, 1);
  static const Color color_F58879 = Color.fromRGBO(245, 136, 121, 1);
  static const Color color_F3705B = Color.fromRGBO(243, 112, 91, 1);
  static const Color color_red = Color.fromRGBO(255, 26, 24, 1.0);
  static const Color color_52C1AD = Color.fromRGBO(82, 193, 173, 1);
  static const Color color_35BF35 = Color.fromRGBO(53, 191, 53, 1);
  static const Color color_3C8FFB = Color.fromRGBO(60, 143, 251, 1);
  static const Color color_017DF0 = Color.fromRGBO(1, 125, 240, 1);
  static const Color color_007BD4 = Color.fromRGBO(0, 123, 212, 1);
  static const Color color_4267B2 = Color.fromRGBO(66, 103, 178, 1);
  static const Color color_3367D6 = Color.fromRGBO(51, 103, 214, 1);

  static final themeBlackMaterialColor = MaterialColor(0xFF0C0D0E, blackShades);

  static final Map<int, Color> blackShades = {
    50: Color.fromRGBO(12, 13, 14, .1),
    100: Color.fromRGBO(12, 13, 14, .2),
    200: Color.fromRGBO(12, 13, 14, .3),
    300: Color.fromRGBO(12, 13, 14, .4),
    400: Color.fromRGBO(12, 13, 14, .5),
    500: Color.fromRGBO(12, 13, 14, .6),
    600: Color.fromRGBO(12, 13, 14, .7),
    700: Color.fromRGBO(12, 13, 14, .8),
    800: Color.fromRGBO(12, 13, 14, .9),
    900: Color.fromRGBO(12, 13, 14, 1),
  };

  static final Map<int, Color> whiteShades = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };
}

class HexColor extends Color {
  static const MethodChannel _channel = MethodChannel('hexcolor');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static int _getColorFromHex(String? hexColor, int defaultColor) {
    if (null != hexColor && hexColor.isNotEmpty) {
      try {
        hexColor = hexColor.toUpperCase().replaceAll('#', '');
        if (hexColor.length == 6) {
          // ignore: prefer_single_quotes
          hexColor = "FF$hexColor";
        }
        return int.parse(hexColor, radix: 16);
      } catch (e) {
        //
      }
    }
    return defaultColor;
  }

  static String toHex(Color color) =>
      '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  HexColor(final String hexColor, {required int defaultColor})
      : super(_getColorFromHex(hexColor, defaultColor));
}
