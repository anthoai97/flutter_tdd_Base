import 'package:awesome_app/awesome_app.dart';
import 'package:awesome_app/core/const.dart';
import 'package:awesome_app/core/utils/log.dart';
import 'package:awesome_app/resources/R.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/helper.dart';
import 'di/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Env
  R.env = EnvType.PRODUCTION;
  Log.debug(R.env, title: "Environment");

  /// Firebase
  await Helper.initFirebaseLibrary();

  /// Localization init
  await Helper.initEasyLocalization();

  /// Dependency init
  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: R.LOCALES,
      path: R.LOCALIZATION_PATH,
      fallbackLocale: Locale('en', 'US'),
      useOnlyLangCode: true,
      child: AwesomeApp(),
    ),
  );
}
