import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../resources/R.dart';
import 'const.dart';

class Helper {
  //

  Helper._();

  static int? stringToInt(String? number) =>
      number == null ? null : int.tryParse(number);

  static String? stringFromInt(int? number) => number?.toString();

  /// Core helper:------------------------------------------------------------
  static Future<void> initFirebaseLibrary() async {
    /// Firebase
    await Firebase.initializeApp();

    /// Crashlytics
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(R.env == EnvType.DEVELOPMENT);

    Function originalOnError = FlutterError.onError!;
    FlutterError.onError = (errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      originalOnError(errorDetails);
    };
  }

  static Future<void> initEasyLocalization() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = [];
  }

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
