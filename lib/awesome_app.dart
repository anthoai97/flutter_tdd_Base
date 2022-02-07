import 'package:awesome_app/resources/themes.dart';
import 'package:flutter/material.dart';
import 'package:awesome_app/core/route/navigation_manager.dart';
import 'package:awesome_app/navigator/routes.dart';
import 'package:easy_localization/easy_localization.dart';

class AwesomeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeDef.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: ThemeDef.darkTheme,
      navigatorKey: NavigationManager().rootNavigator,
      onGenerateRoute: (RouteSettings settings) =>
          AppRouter.generateRoute(context, settings),
      initialRoute: RouteName.DEFAULT,
    );
  }
}
