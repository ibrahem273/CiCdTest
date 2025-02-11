import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'font.dart';

TextTheme appTextTheme(TextTheme base, Color textColor) => base
    .copyWith(
      headlineLarge: base.headlineLarge?.copyWith(
        fontSize: _FontSize.huge,

        ///77
        fontFamily: _sFOpenSansFamily,
        fontWeight: _semiBold,
        letterSpacing: 0,
      ),
      displayLarge: base.displayLarge?.copyWith(
        //24
        fontSize: _FontSize.heading_01,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      displayMedium: base.displayMedium?.copyWith(
// 20
        fontSize: _FontSize.heading_02,

        /// 20
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      displaySmall: base.displaySmall?.copyWith(
        //18
        fontSize: _FontSize.heading_03,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontSize: _FontSize.heading_04,

        /// 24
        fontWeight: _regular,
        letterSpacing: 0,
        fontFamily: _sFDisplayLightFamily,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontSize: _FontSize.heading_05,

        /// 20
        fontWeight: _bold,
        letterSpacing: 0,
        fontFamily: _sFDisplayLightFamily,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontSize: _FontSize.heading_06,

        /// 22
        fontWeight: _medium,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: _FontSize.subtitle_01,

        /// 14
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontSize: _FontSize.subtitle_02,

        /// 12
        fontWeight: _thin,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: _FontSize.body_01,

        /// 16
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: _FontSize.body_02,

        /// 14
        fontWeight: _regular,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontSize: _FontSize.button,

        /// 18
        fontWeight: _bold,
        letterSpacing: 0,
        fontFamily: _sFDisplayLightFamily,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: _FontSize.caption,

        /// 12
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontSize: _FontSize.overline,

        /// 10
        fontWeight: _regular,
        letterSpacing: 0,
        fontFamily: _sFOpenSansFamily,
      ),
    )
    .apply(
      displayColor: textColor,
      bodyColor: textColor,
    );
