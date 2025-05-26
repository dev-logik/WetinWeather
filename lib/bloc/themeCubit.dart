import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeModeState {
  ThemeMode _themeMode;
  bool _isDarkThemed;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkThemed => _isDarkThemed;

  ThemeModeState(this._themeMode, this._isDarkThemed);
}

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit(super.initialState);

  void toggleThemeMode(bool isDarkThemed) {
    bool isLightThemed = state._themeMode == ThemeMode.light;
    emit(
      ThemeModeState(
        state._themeMode = (isLightThemed) ? ThemeMode.dark : ThemeMode.light,
        !isDarkThemed,
      ),
    );
  }
}
