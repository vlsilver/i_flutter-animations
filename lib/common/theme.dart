import 'package:flutter/material.dart';

class AppTheme {
  static const _fontCustom = "Barlow";
  static final backgroundContainer = Color(0x336E7582);
  static TextTheme _customTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      bodyText1: baseTextTheme.bodyText1
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      bodyText2: baseTextTheme.bodyText2
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      headline1: baseTextTheme.headline1
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      headline2: baseTextTheme.headline2
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      headline3: baseTextTheme.headline3
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      headline4: baseTextTheme.headline4
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      headline5: baseTextTheme.headline5
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      headline6: baseTextTheme.headline6
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      subtitle1: baseTextTheme.subtitle1
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      subtitle2: baseTextTheme.subtitle2
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      button: baseTextTheme.button
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      caption: baseTextTheme.caption
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
      overline: baseTextTheme.overline
          .copyWith(fontFamily: _fontCustom, color: Colors.white),
    );
  }

  static get themeData {
    ThemeData _dark = ThemeData.dark().copyWith();
    return _dark.copyWith(
      primaryColor: Colors.blueGrey,
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: Color(0xFFF6F5F5),
      textTheme: _customTextTheme(_dark.textTheme),
      primaryTextTheme: _customTextTheme(_dark.primaryTextTheme),
      accentTextTheme: _customTextTheme(_dark.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
