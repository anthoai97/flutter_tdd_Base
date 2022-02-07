import 'package:awesome_app/resources/styles.dart';
import 'package:flutter/material.dart';

abstract class ThemeDef {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsDef.kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    splashFactory: InkRipple.splashFactory,
    buttonTheme: commonButtonTheme,
    textTheme: textTheme,
    textButtonTheme: textButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
  )..colorScheme.copyWith(secondary: ColorsDef.kAccentColor);

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsDef.kPrimaryColor,
    scaffoldBackgroundColor: ColorsDef.color_black,
    splashFactory: InkRipple.splashFactory,
    buttonTheme: commonButtonTheme,
    textTheme: textBlackTheme,
    textButtonTheme: textButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
  );

  static final TextTheme textTheme = TextTheme(
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

  static final TextTheme textBlackTheme = TextTheme(
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

  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyleDef.textButtonTextStyle,
      ),
      foregroundColor: MaterialStateProperty.all(ColorsDef.kPrimaryColor),
    ),
  );

  static final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyleDef.bodyText1.copyWith(fontWeight: FontWeight.w500),
      ),
      foregroundColor: MaterialStateProperty.all(ColorsDef.color_black),
      padding: MaterialStateProperty.all(
        EdgeInsets.all(1.5 * DimenDef.smallSpacing),
      ),
      side: MaterialStateProperty.all(
        BorderSide(color: ColorsDef.kPrimaryColor),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DimenDef.smallRadius),
        ),
      ),
    ),
  );

  static final ButtonThemeData commonButtonTheme = ButtonThemeData(
    height: DimenDef.buttonHeight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DimenDef.mediumRadius),
    ),
    buttonColor: ColorsDef.kPrimaryColor,
    disabledColor: ColorsDef.color_FAFAFA,
    highlightColor: Colors.white.withOpacity(0.05),
    splashColor: Colors.white.withOpacity(0.1),
  );
}
