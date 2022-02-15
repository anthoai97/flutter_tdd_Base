import 'package:easy_localization/src/public_ext.dart';

class StringDef {
  static StringDef? _instance;

  StringDef._();

  static StringDef get instance {
    if (_instance == null) {
      _instance = StringDef._();
    }

    return _instance!;
  }

  String get noContentFound => 'noContentFound'.tr();
  String get noDataToShowText => 'noDataToShowText'.tr();
  String get commonErrorText => 'commonErrorText'.tr();
}
