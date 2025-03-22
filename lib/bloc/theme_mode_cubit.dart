import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeState {
  ThemeState(this.themeMode);
  final ThemeMode themeMode;
}

class ThemeModeCubit extends Cubit<ThemeState> {
  ThemeModeCubit(super.initialState);
  bool isLightFlag = false;
  void toggleThemeMode(bool isLight) {
    emit(ThemeState((state.themeMode == ThemeMode.light)
        ? ThemeMode.dark
        : ThemeMode.light));
  }
}
