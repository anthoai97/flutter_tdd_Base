import 'package:flutter/material.dart';

class NavigationManager {
  static final _singleton = NavigationManager._internal();

  NavigationManager._internal();

  factory NavigationManager() => _singleton;

  GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get rootNavigator => _rootNavigationKey;

  void popRootNavigator() => _rootNavigationKey.currentState!.pop();

  BuildContext getRootNavigatorContext() => _rootNavigationKey.currentContext!;

  // =================== Navigation Action ===================
  void pop<T extends Object>({BuildContext? context, T? result}) {
    if (null != context) {
      return Navigator.pop(context, result);
    }
    return _rootNavigationKey.currentState!.pop(result);
  }

  Future<dynamic> push(BuildContext context, Route<dynamic> route) {
    return _rootNavigationKey.currentState!.push(route);
  }

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) {
    return _rootNavigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments}) {
    return _rootNavigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    return _rootNavigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) =>
            route.isCurrent && route.settings.name == routeName ? false : true,
        arguments: arguments);
  }

  Future<dynamic> popAndPushNamed(String routeName, {dynamic arguments}) {
    return _rootNavigationKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  void popUntil(String routeName) {
    return _rootNavigationKey.currentState!.popUntil((Route<dynamic> route) =>
        route.isCurrent && route.settings.name == routeName ? false : true);
  }
}
