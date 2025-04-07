import 'package:bloc_app/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyTheme {
  static final lightLextTheme = GoogleFonts.poppinsTextTheme(
    TextTheme(
      headlineLarge: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 32.sp,
        fontWeight: FontWeight.normal,
      ),
      headlineSmall: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 100.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 42.sp,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: LightColorConstants.tertiaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  static final darkLextTheme = GoogleFonts.latoTextTheme(
    TextTheme(
      headlineLarge: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 42,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 32,
        fontWeight: FontWeight.normal,
      ),
      headlineSmall: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 100,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 42,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
          color: DarkColorConstants.tertiaryColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.1,),
      labelSmall: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 16,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        color: DarkColorConstants.tertiaryColor,
        fontSize: 14,
        letterSpacing: 0.25,
      ),
    ),
  );
}
