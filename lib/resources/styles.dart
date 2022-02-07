import 'package:flutter/material.dart';

abstract class PaddingDef {
  static const double smallPadding = 4;
  static const double defaultPadding = 8;
  static const double defaultPhotoPadding = 10;
  static const double defaultItemSpacing = 10;
  static const double defaultTopMarginPadding = 20;
  static const double defaultLeftMarginPadding = 15;

  static const double zero = 0;
  static const double padding_1 = 1;
  static const double padding_2 = 2;
  static const double padding_3 = 3;
  static const double padding_4 = 4;
  static const double padding_5 = 5;
  static const double padding_6 = 6;
  static const double padding_7 = 7;
  static const double padding_8 = 8;
  static const double padding_10 = 10;
  static const double padding_12 = 12;
  static const double padding_14 = 14;
  static const double padding_15 = 15;
  static const double padding_16 = 16;
  static const double padding_18 = 18;
  static const double padding_20 = 20;
  static const double padding_22 = 22;
  static const double padding_25 = 25;
  static const double padding_30 = 30;
  static const double padding_35 = 35;
  static const double padding_40 = 40;
  static const double padding_45 = 45;
  static const double padding_50 = 50;
}

abstract class FontDef {
  static const double defaultTextButtonFontSize = 14;
  static const double defaultTextFontSize = 14;
  static const double defaultItemTitleTextSize = 14;
  static const double defaultItemSubTitleTextSize = 12;
  static const double largeTitleTextSize = 20;

  static const double font_size_5 = 5;
  static const double font_size_6 = 6;
  static const double font_size_7 = 7;
  static const double font_size_8 = 8;
  static const double font_size_9 = 9;
  static const double font_size_10 = 10;
  static const double font_size_11 = 11;
  static const double font_size_12 = 12;
  static const double font_size_13 = 13;
  static const double font_size_14 = 14;
  static const double font_size_15 = 15;
  static const double font_size_16 = 16;
  static const double font_size_18 = 18;
  static const double font_size_20 = 20;
  static const double font_size_22 = 22;
  static const double font_size_24 = 24;
  static const double font_size_32 = 32;
}

abstract class ColorsDef {
  static const Color facebookBackgroundColor = Color.fromRGBO(66, 103, 178, 1);
  static const Color googleBackgroundColor = Color.fromRGBO(51, 103, 214, 1);
  static const Color appleBtnLoginBackgroundColor =
      Color.fromRGBO(17, 17, 17, 1);

  static const Color themeLightBGColor = Color.fromRGBO(239, 239, 241, 1.0);
  static const Color themeTextBlackColor = Colors.black;
  static const Color themeTextGrayColor = Colors.black45;

  static const Color kPrimaryColor = Colors.black;
  static const Color kPrimaryLightColor = Colors.black12;
  static const Color kAccentColor = Colors.white;
  static const Color kDefaultTextColor = Colors.black;
  static const Color kDefaultTextWhiteColor = Colors.white;

  static const Color color_transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color color_black = Color.fromRGBO(0, 0, 0, 1);
  static const Color color_0C0D0E = Color.fromRGBO(12, 13, 14, 1);
  static const Color color_black_0F1317 = Color.fromRGBO(15, 19, 23, 1);
  static const Color color_white = Color.fromRGBO(255, 255, 255, 1);
  static const Color color_FAFAFA = Color.fromRGBO(250, 250, 250, 1);
  static const Color color_F9F9F9 = Color.fromRGBO(249, 249, 249, 1);
  static const Color color_F8F8F8 = Color.fromRGBO(248, 248, 248, 1);
  static const Color color_F4F4F4 = Color.fromRGBO(244, 244, 244, 1);
  static const Color color_F2F2F3 = Color.fromRGBO(242, 242, 243, 1);
  static const Color color_E7E9EC = Color.fromRGBO(231, 233, 236, 1);
  static const Color color_E2E2E4 = Color.fromRGBO(226, 226, 228, 1);
  static const Color color_D1D5DB = Color.fromRGBO(209, 213, 219, 1);
  static const Color color_CDCDCD = Color.fromRGBO(205, 205, 205, 1);
  static const Color color_ACACAC = Color.fromRGBO(172, 172, 172, 1);
  static const Color color_888888 = Color.fromRGBO(136, 136, 136, 1);
  static const Color color_626262 = Color.fromRGBO(98, 98, 98, 1);
  static const Color color_555555 = Color.fromRGBO(85, 85, 85, 1);
  static const Color color_FDF9F1 = Color.fromRGBO(253, 249, 241, 1);
  static const Color color_F2BA44 = Color.fromRGBO(242, 186, 68, 1);
  static const Color color_FF9900 = Color.fromRGBO(255, 153, 0, 1);
  static const Color color_F58879 = Color.fromRGBO(245, 136, 121, 1);
  static const Color color_F3705B = Color.fromRGBO(243, 112, 91, 1);
  static const Color color_red = Color.fromRGBO(255, 26, 24, 1.0);
  static const Color color_52C1AD = Color.fromRGBO(82, 193, 173, 1);
  static const Color color_35BF35 = Color.fromRGBO(53, 191, 53, 1);
  static const Color color_3C8FFB = Color.fromRGBO(60, 143, 251, 1);
  static const Color color_017DF0 = Color.fromRGBO(1, 125, 240, 1);
  static const Color color_007BD4 = Color.fromRGBO(0, 123, 212, 1);
  static const Color color_4267B2 = Color.fromRGBO(66, 103, 178, 1);
  static const Color color_3367D6 = Color.fromRGBO(51, 103, 214, 1);

  static final themeBlackMaterialColor = MaterialColor(0xFF0C0D0E, blackShades);

  static final Map<int, Color> blackShades = {
    50: Color.fromRGBO(12, 13, 14, .1),
    100: Color.fromRGBO(12, 13, 14, .2),
    200: Color.fromRGBO(12, 13, 14, .3),
    300: Color.fromRGBO(12, 13, 14, .4),
    400: Color.fromRGBO(12, 13, 14, .5),
    500: Color.fromRGBO(12, 13, 14, .6),
    600: Color.fromRGBO(12, 13, 14, .7),
    700: Color.fromRGBO(12, 13, 14, .8),
    800: Color.fromRGBO(12, 13, 14, .9),
    900: Color.fromRGBO(12, 13, 14, 1),
  };

  static final Map<int, Color> whiteShades = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };
}

abstract class DimenDef {
  /// [smallSpacing] 8.0
  static const double smallSpacing = 8.0;

  /// [mediumSpacing] 16.0
  static const double mediumSpacing = 15.0;

  /// [mediumSpacing2] 24.0
  static const double mediumSpacing2 = 20.0;

  /// [bigSpacing] 32.0
  static const double bigSpacing = 30.0;

  ///
  /// [smallRadius] 12.0
  static const double smallRadius = 12.0;

  /// [mediumRadius] 16.0
  static const double mediumRadius = 16.0;

  /// [bigRadius] 20.0
  static const double bigRadius = 20.0;

  ///
  /// [textFieldHeight] 46.0
  static const double textFieldHeight = 46.0;

  /// [messageTextFieldHeight] 40.0
  static const double messageTextFieldHeight = 46.0;

  /// [smallButtonHeight] 20.0
  static const double tinyButtonHeight = 20.0;

  /// [smallButtonHeight] 28.0
  static const double smallButtonHeight = 28.0;

  /// [mediumButtonHeight] 32.0
  static const double mediumButtonHeight = 34.0;

  /// [smallButtonHeight] 50.0
  static const double buttonHeight = 50.0;

  /// [bottomNavHeight] 64.0
  static const double bottomNavHeight = 64.0;

  /// [toggleHeight] 40.0
  static const double toggleHeight = 40.0;

  /// [superTinyIconSize] 12.0
  static const double superTinyIconSize = 12.0;

  /// [tinyIconSize] 14.0
  static const double tinyIconSize = 14.0;

  /// [smallIconSize2] 18.0
  static const double smallIconSize2 = 18.0;

  /// [smallIconSize] 20.0
  static const double smallIconSize = 20.0;

  /// [mediumIconSize] 24.0
  static const double mediumIconSize = 24.0;

  /// [bigIconSize] 28.0
  static const double bigIconSize = 28.0;

  /// [dividerThickness] 0.5
  static const double dividerThickness = 0.5;

  /// [smallChipHeight] 26.0
  static const double smallChipHeight = 26.0;

  ///
  /// [overline] 10.0
  static const double overline = 10.0;

  /// [caption] 12.0
  static const double caption = 12.0;

  /// [buttonText] 14.0
  static const double buttonText = 14.0;

  /// [bodyText2] 14.0
  static const double bodyText2 = 14.0;

  /// [bodyText1] 16.0
  static const double bodyText1 = 16.0;

  /// [subtitle2] 14.0
  static const double subtitle2 = 14.0;

  /// [subtitle1] 16.0
  static const double subtitle1 = 16.0;

  /// [headline6] 20.0
  static const double headline6 = 20.0;

  /// [headline5] 24.0
  static const double headline5 = 24.0;

  /// [headline4] 34.0
  static const double headline4 = 34.0;

  /// [headline3] 48.0
  static const double headline3 = 48.0;

  /// [headline2] 60.0
  static const double headline2 = 60.0;

  /// [headline1] 96.0
  static const double headline1 = 96.0;
}

abstract class TextStyleDef {
  static const TextStyle defaultTextStyle = subtitle2;

  static final TextStyle defaultHintTextStyle = subtitle2.copyWith(
    color: ColorsDef.kDefaultTextColor.withOpacity(0.5),
  );

  static final TextStyle textButtonTextStyle = button.copyWith(
    color: ColorsDef.kPrimaryColor,
  );

  static final TextStyle commonButtonTextStyle = bodyText1.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle overline = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.overline,
    letterSpacing: 1.5,
  );

  static const TextStyle caption = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.caption,
    letterSpacing: 0.4,
  );

  static const TextStyle button = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.buttonText,
    letterSpacing: 1.25,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.bodyText2,
    letterSpacing: 0.25,
  );

  static const TextStyle bodyText1 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.bodyText1,
    letterSpacing: 0.5,
  );

  static const TextStyle subtitle2 = const TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.subtitle2,
    letterSpacing: 0.1,
  );

  static const TextStyle subtitle1 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.subtitle1,
    letterSpacing: 0.15,
  );

  static const TextStyle headline6 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.headline6,
    letterSpacing: 0.15,
  );

  static const TextStyle headline5 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.headline5,
  );

  static const TextStyle headline4 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.headline4,
    letterSpacing: 0.25,
  );

  static const TextStyle headline3 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.headline3,
  );

  static const TextStyle headline2 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.headline2,
    letterSpacing: -0.5,
  );

  static const TextStyle headline1 = TextStyle(
    color: ColorsDef.kDefaultTextColor,
    fontSize: DimenDef.headline1,
    letterSpacing: -1.5,
  );
}
