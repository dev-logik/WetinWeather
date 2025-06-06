import 'package:bloc_app/theme/typography.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLightTheme {
  AppLightTheme._();

  static final lightThemeData = ThemeData(
    //Defines and overrides the default background color of the scaffold widget.
    scaffoldBackgroundColor: LightColorConstants.primaryColor,

    //Defines the primary color of the ThemeData object.
    primaryColor: LightColorConstants.primaryColor,

    // Defines and overrides the default theme for the card widgets.
    cardTheme: CardThemeData(
      color: LightColorConstants.secondaryColor_2,
    ),

    //Defines and overrides the default theme for the segmented button widgets.
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        backgroundColor: LightColorConstants.secondaryColor_2,
        alignment: Alignment.center,
        disabledBackgroundColor: LightColorConstants.secondaryColor_2,
        disabledForegroundColor: LightColorConstants.tertiaryColor,
        enableFeedback: true,
        foregroundColor: LightColorConstants.tertiaryColor,
        selectedBackgroundColor: LightColorConstants.secondaryColor_1,
        selectedForegroundColor: LightColorConstants.tertiaryColor,
        iconColor: LightColorConstants.tertiaryColor,
        iconSize: 24.0,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    ),

    //Defines and overrides the default theme for the list tile widgets.
    listTileTheme: ListTileThemeData(
      tileColor: LightColorConstants.secondaryColor_2,
      textColor: LightColorConstants.tertiaryColor,
      enableFeedback: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      style: ListTileStyle.list,
      visualDensity: VisualDensity.compact,
    ),

    //Defines and overrides the default theme for the iconbutton widgets
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: 24.0.dg,
        foregroundColor: LightColorConstants.tertiaryColor,
      ),
    ),
    iconTheme: IconThemeData(
      size: 24,
      color: LightColorConstants.tertiaryColor,
    ),
    //Defines and overrides the default theme for the bottomnavigationbar widgets.
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColorConstants.primaryColor,
      selectedIconTheme: IconThemeData(
        color: LightColorConstants.tertiaryColor,
        size: 24.0.dg,
      ),
      selectedItemColor: LightColorConstants.tertiaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.blueGrey,
        size: 24.0,
      ),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
    ),

    //Defines the themeMode of the ThemeData object configuration.
    brightness: Brightness.light,

    //Defines the ColorScheme of the ThemeData object configuration.
    colorScheme: ColorScheme.fromSeed(seedColor: LightColorConstants.seedColor),

    //Defines the input decoration theme for the text field.
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.0),
      ),
      fillColor: LightColorConstants.secondaryColor_2,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5.0),
      ),
    ),

    //Defines the TextTheme of the ThemeData object configuration.
    textTheme: TypographyTheme.darkLextTheme,
  );
}
