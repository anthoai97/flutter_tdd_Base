import 'package:awesome_app/core/const.dart';
import 'package:awesome_app/core/utils/screen_utils.dart';
import 'package:awesome_app/resources/images.dart';
import 'package:awesome_app/resources/string.dart';
import 'package:awesome_app/resources/themes.dart';
import 'package:flutter/material.dart';

class R {
  R._();

  static const String applicationId = '';
  static const String appName = "Awsome App";

  static final ThemeDef themes = ThemeDef.instance;
  static final ScreenUtil screenUtil = ScreenUtil.instance;
  static final ImageDef images = ImageDef.instance;
  static final StringDef strings = StringDef.instance;

  /// Localization config
  static const String LOCALIZATION_PATH = 'assets/translations';
  static const List<Locale> LOCALES = [Locale('en'), Locale('vi')];

  // Env
  static late EnvType env;

  static void init(BuildContext context) {
    /// Init screen utils
    MediaQueryData data = MediaQuery.of(context);
    ScreenUtil.instance.init(data);
  }
}
