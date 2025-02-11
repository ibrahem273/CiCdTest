import 'package:flutter/material.dart';
import 'package:pos_app/config/theme/typography.dart';

// import 'package:pos_app/config/theme/typography.dart';

part 'dark_color_scheme.dart';
part 'light_color_scheme.dart';

const defaultAppTheme = ThemeMode.light;

class AppTheme {
  static ThemeData get _builtInLightTheme => ThemeData.light();

  static ThemeData get _buildInDarkTheme => ThemeData.dark();

  static ThemeData get light {
    final textTheme =
        appTextTheme(_builtInLightTheme.textTheme, _lightColorScheme.primary);

    return _builtInLightTheme.copyWith(
      // primaryColorLight: Colors.blue  ,
      sliderTheme: SliderThemeData(
        activeTickMarkColor: Colors.teal, activeTrackColor: Colors.teal,

        valueIndicatorColor: Colors.teal,
        disabledActiveTickMarkColor: Colors.teal,
        disabledActiveTrackColor: Colors.teal,
        disabledInactiveTickMarkColor: Colors.teal,
        disabledInactiveTrackColor: Colors.teal,
        // valueIndicatorTextStyle: textTheme.subtitle1!.copyWith(color: Colors.teal)
      ),
      canvasColor: Colors.transparent,
      colorScheme: _lightColorScheme,
      textTheme: textTheme,
      typography: Typography.material2018(),
      scaffoldBackgroundColor: _lightColorScheme.surface,
      primaryColor: _lightColorScheme.primary,
    );
  }

  static ThemeData get dark {
    final textTheme =
        appTextTheme(_builtInLightTheme.textTheme, _darkColorScheme.primary);
    return _buildInDarkTheme.copyWith(
      colorScheme: _darkColorScheme,
      textTheme: textTheme,
      sliderTheme: SliderThemeData(
          activeTickMarkColor: Colors.teal,
          activeTrackColor: Colors.teal,
          valueIndicatorColor: Colors.teal,
          disabledActiveTickMarkColor: Colors.teal,
          disabledActiveTrackColor: Colors.teal,
          disabledInactiveTickMarkColor: Colors.teal,
          disabledInactiveTrackColor: Colors.teal,
          valueIndicatorTextStyle: TextStyle(color: Colors.black)),
      typography: Typography.material2018(),
      scaffoldBackgroundColor: _lightColorScheme.surface,
      primaryColor: _lightColorScheme.primary,
    );
  }
}
