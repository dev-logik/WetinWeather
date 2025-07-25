import 'package:bloc_app/data/database/hive_local_storage.dart';
import 'package:chopper/chopper.dart' show Response;

import '../models/models.dart';

typedef WeatherVariables = List<CurrentWeatherVariableModel>;
typedef HourlyForecasts = List<HourlyWeatherForecastModel>;
typedef ResponseFuture = Future<Response<Result>>;
typedef CurrentWeatherHive = HiveLocalStorage<CurrentWeatherVariableModel>;
typedef CurrentPollutantHive = HiveLocalStorage<CurrentPollutantModel>;
typedef HourlyForecastsHive = HiveLocalStorage<HourlyWeatherForecastModel>;
typedef JsonMap = Map<String, dynamic>;
