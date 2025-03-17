import 'package:bloc_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typography {
  static final lightLextTheme = AppLightTheme.lightThemeData.copyWith(
    textTheme: GoogleFonts.latoTextTheme(AppLightTheme.lightThemeData.textTheme),
  );
  static final darkLextTheme = TextTheme();
}
