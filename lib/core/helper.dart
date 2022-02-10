import 'package:flutter/material.dart';

class Helper {
  //

  Helper._();

  static int? stringToInt(String? number) =>
      number == null ? null : int.tryParse(number);

  static String? stringFromInt(int? number) => number?.toString();

  //
}

class HexColor extends Color {
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
