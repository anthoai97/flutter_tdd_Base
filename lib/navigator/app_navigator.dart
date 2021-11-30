import 'package:awesome_app/core/route/navigation_manager.dart';
import 'package:awesome_app/navigator/routes.dart';
import 'package:flutter/cupertino.dart';

class AppNavigator {
  static void goBack<T extends Object>({BuildContext? context, T? result}) {
    NavigationManager().pop(context: context, result: result);
  }

  static Future<dynamic> navigateToHome() {
    return NavigationManager().pushReplacementNamed(RouteName.HOME);
  }
}
