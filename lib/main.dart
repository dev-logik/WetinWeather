import 'package:bloc_app/bloc/theme_mode_cubit.dart';
import 'package:bloc_app/route/router_config.dart';
import 'package:bloc_app/theme/dark_theme.dart';
import 'package:bloc_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    BlocProvider<ThemeModeCubit>(
      create: (context) => ThemeModeCubit(
        ThemeState(ThemeMode.light),
      ),
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
        return ScreenUtilInit(
          designSize: Size(360, 690),
          builder: (context, child) => MaterialApp.router(
            title: 'WetinWeather',
            theme: AppLightTheme.lightThemeData,
            darkTheme: AppDarkTheme.darkThemeData,
            routerConfig: goRouterConfig,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
