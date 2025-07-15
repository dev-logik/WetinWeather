import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeModeState {
  ThemeMode _themeMode;
  bool _isDarkThemed;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkThemed => _isDarkThemed;

  ThemeModeState({
    ThemeMode themeMode = ThemeMode.light,
    bool isDarkThemed = false,
  }) : _themeMode = themeMode,
       _isDarkThemed = isDarkThemed;
}

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit(super.initialState);

  void toggleThemeMode(bool isDarkThemed) {
    bool isLightThemed = state._themeMode == ThemeMode.light;
    emit(
      ThemeModeState(
        themeMode:
            state._themeMode =
                (isLightThemed) ? ThemeMode.dark : ThemeMode.light,
        isDarkThemed: !isDarkThemed,
      ),
    );
  }
}
