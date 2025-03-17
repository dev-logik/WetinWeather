import 'package:bloc_app/Bloc/counter_bloc.dart';
import 'package:bloc_app/presentation/screens/counter_ui.dart';
import 'package:bloc_app/route/router_config.dart';
import 'package:bloc_app/theme/dark_theme.dart';
import 'package:bloc_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppLightTheme.lightThemeData,
      darkTheme: AppDarkTheme.darkThemeData,
      routerConfig: GoRouterConfig.goRouter,
      themeMode: ThemeMode.light,
    );
  }
}
