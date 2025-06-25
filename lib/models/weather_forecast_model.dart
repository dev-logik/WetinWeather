import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_model.g.dart';

@JsonSerializable()
class WeatherForecastModel {
  //Weather variables
  @JsonKey(name: 'temperature_2m')
  final double temperature;
  @JsonKey(name: 'relative_humidity_2m')
  final double relativeHumidity;
  @JsonKey(name: 'apparent_temperature')
  final double realFeel;
  @JsonKey(name: 'is_day')
  final int isDay;
  @JsonKey(name: 'precipitation')
  final double total_precipitation;
  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed;
  @JsonKey(name: 'wind_direction_10m')
  final double windDirection;
  @JsonKey(name: 'weather_code')
  final int weatherCode;
  @JsonKey(name: 'rain')
  final double rain;
  @JsonKey(name: 'showers')
  final double showers;
  @JsonKey(name: 'snowfall')
  final double snowfall;
  @JsonKey(name: 'cloud_cover')
  final int cloudCover;

  //Units
  @JsonKey()
  final String tempUnit;
  final String windSpeedUnit;
  final String precipitationUnit;
  final String relativeHumidityUnit;
  final String snowFallUnit;
  final String cloudCoverUnit;

  const WeatherForecastModel({
    required this.temperature,
    required this.relativeHumidity,
    required this.realFeel,
    required this.isDay,
    required this.total_precipitation,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherCode,
    required this.rain,
    required this.showers,
    required this.snowfall,
    required this.cloudCover,
    this.tempUnit = '°C',
    this.precipitationUnit = 'mm',
    this.relativeHumidityUnit = '%',
    this.windSpeedUnit = 'km/h',
    this.snowFallUnit = 'cm',
    this.cloudCoverUnit = '%',
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastModelFromJson(json);
}
