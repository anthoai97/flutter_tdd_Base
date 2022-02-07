import 'package:awesome_app/resources/string.dart';
import 'package:awesome_app/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NoContentFoundScreen extends StatelessWidget {
  NoContentFoundScreen({Key? key, this.msg}) : super(key: key);

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(AppString.noContentFound.tr()),
        automaticallyImplyLeading: true,
        cupertino: (context, platform) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
      ),
      body: Center(
        child: Text(
          msg ?? AppString.noContentFound.tr(),
          style: TextStyle(fontSize: FontDef.defaultTextFontSize),
        ),
      ),
    );
  }
}
