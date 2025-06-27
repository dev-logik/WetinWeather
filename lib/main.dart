import 'package:bloc_app/data/repositories/repositories.dart';
import 'package:bloc_app/route/router_config.dart';
import 'package:bloc_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';

import 'bloc/cubits_blocs.dart';

void _initLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}

void main() async {
  _initLogging();
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  ThemeModeCubit(ThemeModeState(ThemeMode.light, false)),
        ),

        BlocProvider(
          create: (context) => DateTimeCubit(DateTimeState(DateTime.now())),
        ),
        BlocProvider(create: (context) => LocationCubit(LocationState())),
        BlocProvider(
          create: (context) => AirQualityBloc(AirQualityRepository()),
        ),
        BlocProvider(create: (context) => WeatherDataBloc(WeatherRepository())),
      ],
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
    final screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var themeProvider = context.watch<ThemeModeCubit>();
    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      builder:
          (context, child) => MaterialApp.router(
            title: 'WetinWeather',
            theme: AppLightTheme.lightThemeData,
            darkTheme: AppDarkTheme.darkThemeData,
            routerConfig: goRouterConfig,
            themeMode: themeProvider.state.themeMode,
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}
