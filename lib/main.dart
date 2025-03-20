import 'package:bloc_app/route/router_config.dart';
import 'package:bloc_app/theme/dark_theme.dart';
import 'package:bloc_app/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with GoRouterConfig {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WetinWeather',
      theme: AppLightTheme.lightThemeData,
      darkTheme: AppDarkTheme.darkThemeData,
      routerConfig: goRouterConfig,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
