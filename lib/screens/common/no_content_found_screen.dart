import 'package:awesome_app/resources/R.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NoContentFoundScreen extends StatelessWidget {
  NoContentFoundScreen({Key? key, this.msg}) : super(key: key);

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(R.strings.noContentFound.tr()),
        automaticallyImplyLeading: true,
        cupertino: (context, platform) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
      ),
      body: Center(
        child: Text(
          msg ?? R.strings.noContentFound.tr(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
