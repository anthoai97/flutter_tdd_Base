import 'package:awesome_app/awesome_app.dart';
import 'package:awesome_app/resources/R.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Localization init
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

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
