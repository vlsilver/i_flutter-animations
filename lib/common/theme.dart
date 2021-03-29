import 'package:flutter/material.dart';

class AppTheme {
  static const _colorCustom1 = Color(0xFFF6F5F5);
  static const _colorCustom4 = Color(0xFF276678);
  static const _black = Color(0xFF000000);
  static const _fontCustom = "Barlow";

  static TextTheme _customTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      bodyText1: baseTextTheme.bodyText1
          .copyWith(fontFamily: _fontCustom, color: _black),
      bodyText2: baseTextTheme.bodyText2
          .copyWith(fontFamily: _fontCustom, color: _black),
      headline1: baseTextTheme.headline1
          .copyWith(fontFamily: _fontCustom, color: _black),
      headline2: baseTextTheme.headline2
          .copyWith(fontFamily: _fontCustom, color: _black),
      headline3: baseTextTheme.headline3
          .copyWith(fontFamily: _fontCustom, color: _black),
      headline4: baseTextTheme.headline4
          .copyWith(fontFamily: _fontCustom, color: _black),
      headline5: baseTextTheme.headline5
          .copyWith(fontFamily: _fontCustom, color: _black),
      headline6: baseTextTheme.headline6
          .copyWith(fontFamily: _fontCustom, color: _black),
      subtitle1: baseTextTheme.subtitle1
          .copyWith(fontFamily: _fontCustom, color: _black),
      subtitle2: baseTextTheme.subtitle2
          .copyWith(fontFamily: _fontCustom, color: _black),
      button: baseTextTheme.button.copyWith(fontFamily: _fontCustom, color: _black),
      caption: baseTextTheme.caption.copyWith(fontFamily: _fontCustom, color: _black),
      overline: baseTextTheme.overline.copyWith(fontFamily: _fontCustom, color: _black),
    );
  }

  static get themeData {
    ThemeData _dark = ThemeData.dark();
    return _dark.copyWith(
      colorScheme: ColorScheme.dark(),
      primaryColor: _colorCustom4,
      buttonColor: _colorCustom4,
      backgroundColor: _colorCustom1,
      scaffoldBackgroundColor: _colorCustom1,
      errorColor: const Color(0xFFB00020),
      textTheme: _customTextTheme(_dark.textTheme),
      primaryTextTheme: _customTextTheme(_dark.primaryTextTheme),
      accentTextTheme: _customTextTheme(_dark.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
