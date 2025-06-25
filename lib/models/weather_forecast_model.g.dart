// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastModel _$WeatherForecastModelFromJson(
  Map<String, dynamic> json,
) => WeatherForecastModel(
  temperature: (json['temperature_2m'] as num).toDouble(),
  relativeHumidity: (json['relative_humidity_2m'] as num).toDouble(),
  realFeel: (json['apparent_temperature'] as num).toDouble(),
  isDay: (json['is_day'] as num).toInt(),
  total_precipitation: (json['precipitation'] as num).toDouble(),
  windSpeed: (json['wind_speed_10m'] as num).toDouble(),
  windDirection: (json['wind_direction_10m'] as num).toDouble(),
  weatherCode: (json['weather_code'] as num).toInt(),
  rain: (json['rain'] as num).toDouble(),
  showers: (json['showers'] as num).toDouble(),
  snowfall: (json['snowfall'] as num).toDouble(),
  cloudCover: (json['cloud_cover'] as num).toInt(),
  tempUnit: json['tempUnit'] as String? ?? '°C',
  precipitationUnit: json['precipitationUnit'] as String? ?? 'mm',
  relativeHumidityUnit: json['relativeHumidityUnit'] as String? ?? '%',
  windSpeedUnit: json['windSpeedUnit'] as String? ?? 'km/h',
  snowFallUnit: json['snowFallUnit'] as String? ?? 'cm',
  cloudCoverUnit: json['cloudCoverUnit'] as String? ?? '%',
);

Map<String, dynamic> _$WeatherForecastModelToJson(
  WeatherForecastModel instance,
) => <String, dynamic>{
  'temperature_2m': instance.temperature,
  'relative_humidity_2m': instance.relativeHumidity,
  'apparent_temperature': instance.realFeel,
  'is_day': instance.isDay,
  'precipitation': instance.total_precipitation,
  'wind_speed_10m': instance.windSpeed,
  'wind_direction_10m': instance.windDirection,
  'weather_code': instance.weatherCode,
  'rain': instance.rain,
  'showers': instance.showers,
  'snowfall': instance.snowfall,
  'cloud_cover': instance.cloudCover,
  'tempUnit': instance.tempUnit,
  'windSpeedUnit': instance.windSpeedUnit,
  'precipitationUnit': instance.precipitationUnit,
  'relativeHumidityUnit': instance.relativeHumidityUnit,
  'snowFallUnit': instance.snowFallUnit,
  'cloudCoverUnit': instance.cloudCoverUnit,
};
