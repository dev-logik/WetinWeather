import 'package:hive_ce/hive.dart';

import '../models/models.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<HourlyWeatherForecastModel>(),
  AdapterSpec<CurrentPollutantModel>(),
  AdapterSpec<CurrentWeatherVariableModel>(),
  AdapterSpec<AirQualityConcUnits>(),
])
// ignore: unused_element
void _() {}
