import 'package:awesome_app/resources/styles.dart';
import 'package:flutter/material.dart';

class ThemeDef {
  static ThemeDef? _instance;

  ThemeDef._();

  static ThemeDef get instance {
    if (_instance == null) {
      _instance = ThemeDef._();
    }

    return _instance!;
  }

  late final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsDef.kPrimaryColor,
    scaffoldBackgroundColor: ColorsDef.color_white,
    splashFactory: InkRipple.splashFactory,
    buttonTheme: commonButtonTheme,
    textTheme: textTheme,
    textButtonTheme: textButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    appBarTheme: appBarTheme,
  )..colorScheme.copyWith(secondary: ColorsDef.kAccentColor);

  late final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsDef.kPrimaryColor,
    scaffoldBackgroundColor: ColorsDef.color_black,
    splashFactory: InkRipple.splashFactory,
    buttonTheme: commonButtonTheme,
    textTheme: textBlackTheme,
    textButtonTheme: textButtonTheme,
    outlinedButtonTheme: outlinedButtonDarkTheme,
    appBarTheme: appBarTheme.copyWith(backgroundColor: ColorsDef.color_black),
  )..colorScheme.copyWith(secondary: ColorsDef.kAccentColor);

  late final TextTheme textTheme = TextTheme(
    headline1: TextStyleDef.headline1,
    headline2: TextStyleDef.headline2,
    headline3: TextStyleDef.headline3,
    headline4: TextStyleDef.headline4,
    headline5: TextStyleDef.headline5,
    headline6: TextStyleDef.headline6,
    subtitle1: TextStyleDef.subtitle1,
    subtitle2: TextStyleDef.subtitle2,
    bodyText1: TextStyleDef.bodyText1,
    bodyText2: TextStyleDef.bodyText2,
    caption: TextStyleDef.caption,
    button: TextStyleDef.button,
    overline: TextStyleDef.overline,
  );

  late final TextTheme textBlackTheme = TextTheme(
    headline1: TextStyleDef.headline1
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    headline2: TextStyleDef.headline2
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    headline3: TextStyleDef.headline3
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    headline4: TextStyleDef.headline4
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    headline5: TextStyleDef.headline5
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    headline6: TextStyleDef.headline6
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    subtitle1: TextStyleDef.subtitle1
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    subtitle2: TextStyleDef.subtitle2
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    bodyText1: TextStyleDef.bodyText1
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    bodyText2: TextStyleDef.bodyText2
        .copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    caption:
        TextStyleDef.caption.copyWith(color: ColorsDef.kDefaultTextWhiteColor),
    button: TextStyleDef.button,
    overline:
        TextStyleDef.overline.copyWith(color: ColorsDef.kDefaultTextWhiteColor),
  );

  late final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
        primary: ColorsDef.color_white,
        backgroundColor: ColorsDef.kAccentColor,
        alignment: Alignment.center,
        padding: EdgeInsets.all(1.5 * DimenDef.smallSpacing),
        textStyle: TextStyleDef.textButtonTextStyle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DimenDef.smallRadius),
        ),
        onSurface: ColorsDef.color_white),
  );

  late final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: ColorsDef.color_black,
      backgroundColor: ColorsDef.kPrimaryLightColor,
      alignment: Alignment.center,
      padding: EdgeInsets.all(1.5 * DimenDef.smallSpacing),
      textStyle: TextStyleDef.textButtonTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimenDef.smallRadius),
      ),
    ),
  );

  late final OutlinedButtonThemeData outlinedButtonDarkTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: ColorsDef.color_white,
      backgroundColor: ColorsDef.kPrimaryLightColor,
      alignment: Alignment.center,
      padding: EdgeInsets.all(1.5 * DimenDef.smallSpacing),
      textStyle: TextStyleDef.textButtonTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimenDef.smallRadius),
      ),
    ),
  );

  late final ButtonThemeData commonButtonTheme = ButtonThemeData(
    height: DimenDef.buttonHeight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DimenDef.mediumRadius),
    ),
    buttonColor: ColorsDef.kAccentColor,
    disabledColor: ColorsDef.color_FAFAFA,
    highlightColor: Colors.white.withOpacity(0.05),
    splashColor: Colors.white.withOpacity(0.1),
  );

  late final AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyleDef.appbar,
    backgroundColor: ColorsDef.kAccentColor,
  );

  //
}
