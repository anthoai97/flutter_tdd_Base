import 'package:awesome_app/awesome_app.dart';
import 'package:awesome_app/core/const.dart';
import 'package:awesome_app/core/utils/log.dart';
import 'package:awesome_app/resources/R.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'di/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Env
  R.env = EnvType.DEVELOPMENT;
  Log.debug(R.env, title: "Environment");

  /// Localization init
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

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
