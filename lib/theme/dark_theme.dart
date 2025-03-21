import 'package:bloc_app/theme/typography.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:flutter/material.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static final darkThemeData = ThemeData(
    //Defines and overrides the default background color of the scaffold widget.
    scaffoldBackgroundColor: DarkColorConstants.primaryColor,

    //Defines the primary color of the ThemeData object.
    primaryColor: DarkColorConstants.primaryColor,

    // Defines and overrides the default theme for the card widgets.
    cardTheme: CardThemeData(
      color: DarkColorConstants.secondaryColor_2,
    ),

    //Defines and overrides the default theme for the segmented button widgets.
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        backgroundColor: DarkColorConstants.secondaryColor_2,
        alignment: Alignment.center,
        disabledBackgroundColor: DarkColorConstants.secondaryColor_2,
        disabledForegroundColor: DarkColorConstants.tertiaryColor,
        enableFeedback: true,
        foregroundColor: DarkColorConstants.tertiaryColor,
        selectedBackgroundColor: DarkColorConstants.secondaryColor_1,
        selectedForegroundColor: DarkColorConstants.tertiaryColor,
        iconColor: DarkColorConstants.tertiaryColor,
        iconSize: 24.0,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    ),

    //Defines and overrides the default theme for the list tile widgets.
    listTileTheme: ListTileThemeData(
      tileColor: DarkColorConstants.secondaryColor_2,
      textColor: DarkColorConstants.tertiaryColor,
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
        iconSize: 24.0,
        foregroundColor: DarkColorConstants.tertiaryColor,
      ),
    ),

    //Defines and overrides the default theme for the bottomnavigationbar widgets.
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColorConstants.primaryColor,
      selectedIconTheme: IconThemeData(
        color: DarkColorConstants.tertiaryColor,
        size: 24.0,
      ),
      selectedItemColor: DarkColorConstants.tertiaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey[100],
        size: 24.0,
      ),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
    ),

    //Defines the themeMode of the ThemeData object configuration.
    brightness: Brightness.dark,

    //Defines the ColorScheme of the ThemeData object configuration.
    colorScheme: ColorScheme.fromSeed(
      seedColor: LightColorConstants.seedColor,
      brightness: Brightness.dark,
    ),

    //Defines the input decoration theme for the text field.
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.0),
      ),
      fillColor: DarkColorConstants.secondaryColor_2,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5.0),
      ),
    ),    

    //Defines the TextTheme of the ThemeData object configuration.
    textTheme: TypographyTheme.darkLextTheme,
  );
}
