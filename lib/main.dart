import 'package:bloc_app/data/database/hive_local_storage.dart';
import 'package:bloc_app/data/repositories/repositories.dart';
import 'package:bloc_app/hive/hive_registrar.g.dart';
import 'package:bloc_app/models/current_pollutant_model.dart';
import 'package:bloc_app/models/current_weather_model.dart';
import 'package:bloc_app/route/router_config.dart';
import 'package:bloc_app/theme/theme.dart';
import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/cubits_blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initLogging();
  final hiveMap = await _initHive();
  await dotenv.load(fileName: '.env');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeModeCubit(ThemeModeState())),
        BlocProvider(
          create: (context) => DateTimeCubit(DateTimeState(DateTime.now())),
        ),
        BlocProvider(create: (context) => LocationCubit(LocationState())),
        BlocProvider(
          create:
              (context) => AirQualityBloc(
                AirQualityRepository(
                  currentPollutantStorage:
                      hiveMap['current_pollutant_storage']
                          as CurrentPollutantHive,
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => WeatherDataBloc(
                WeatherRepository(
                  currentWeatherStorage:
                      hiveMap['current_weather_storage'] as CurrentWeatherHive,
                ),
              ),
        ),
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
      minTextAdapt: true,
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

void _initLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}

Future<Map<String, HiveLocalStorage>> _initHive() async {
  final appDirectory = await getApplicationDocumentsDirectory();

  await Hive
    ..init(appDirectory.path)
    ..registerAdapters();

  final currentWeatherBoxName = 'currentWeatherBox';
  final currentWeatherKey = 'current_weather_data';
  final currentPollutantBoxName = 'currentPollutantBox';
  final currentPollutantKey = 'current_pollutant_data';

  final currentWeatherStorage =
      await HiveLocalStorage.create<CurrentWeatherVariableModel>(
        boxName: currentWeatherBoxName,
        dataKey: currentWeatherKey,
      );

  final currentPollutantStorage =
      await HiveLocalStorage.create<CurrentPollutantModel>(
        boxName: currentPollutantBoxName,
        dataKey: currentPollutantKey,
      );

  final storage = {
    'current_weather_storage': currentWeatherStorage,
    'current_pollutant_storage': currentPollutantStorage,
  };

  return storage;
}
