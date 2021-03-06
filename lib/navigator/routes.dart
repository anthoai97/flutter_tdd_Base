import 'package:awesome_app/resources/R.dart';
import 'package:awesome_app/screens/common/no_content_found_screen.dart';
import 'package:awesome_app/features/example/presentation/page/example_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

abstract class RouteName {
  static const String DEFAULT = '/';
  static const String UNKNOWN = 'unKnow';

  static const String HOME = 'home';
}

class AppRouter {
  /// Main function
  static Route<dynamic> generateRoute(
      BuildContext context, RouteSettings settings) {
    // Map<String, dynamic> arguments =
    //     jsonDecode(jsonEncode(settings.arguments)) as Map<String, dynamic>;
    switch (settings.name) {
      case RouteName.DEFAULT:
      case RouteName.HOME:
        return platformPageRoute(
            context: context,
            builder: (ctx) {
              initResource(ctx);
              return ExampleScreen();
            });
      default:
        return platformPageRoute(
            context: context,
            builder: (_) {
              return NoContentFoundScreen();
            });
    }
  }

  static void initResource(BuildContext context) {
    try {
      R.init(context);
    } catch (e) {
      // ignore
    }
  }
}
