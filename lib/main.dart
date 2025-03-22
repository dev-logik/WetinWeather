import 'package:bloc_app/bloc/counter_bloc.dart';
import 'package:bloc_app/bloc/theme_mode_cubit.dart';
import 'package:bloc_app/route/router_config.dart';
import 'package:bloc_app/theme/dark_theme.dart';
import 'package:bloc_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<ThemeModeCubit>(
      create: (context) => ThemeModeCubit(ThemeState(ThemeMode.system)),
      child: MyApp(),
    ),
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
    return BlocBuilder<ThemeModeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'WetinWeather',
          theme: AppLightTheme.lightThemeData,
          darkTheme: AppDarkTheme.darkThemeData,
          routerConfig: goRouterConfig,
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
