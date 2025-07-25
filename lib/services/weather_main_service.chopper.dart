// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MainWeatherService extends MainWeatherService {
  _$MainWeatherService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MainWeatherService;

  @override
  Future<Response<Result<dynamic>>> getCurrentWeatherDetails({
    required double lat,
    required double lon,
    String windSpeedUnit = 'kmh',
    String precipitationUnit = 'mm',
  }) {
    final Uri $url = Uri.parse(
      '/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,surface_pressure,wind_speed_10m,wind_direction_10m,weather_code,rain,showers,snowfall,cloud_cover&wind_speed_unit={wind_speed_unit}&precipitation_unit={precipitation_unit}',
    );
    final Map<String, dynamic> $params = <String, dynamic>{
      'latitude': lat,
      'longitude': lon,
      'wind_speed_unit': windSpeedUnit,
      'precipitation_unit': precipitationUnit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<dynamic>, Result<dynamic>>($request);
  }

  @override
  Future<Response<Result<dynamic>>> getHourlyWeatherForecast({
    required double lat,
    required double lon,
    int forecastDays = 1,
  }) {
    final Uri $url = Uri.parse(
      '/v1/forecast?latitude={latitude}&longitude={longitude}&hourly=temperature_2m,relative_humidity_2m,dew_point_2m,apparent_temperature,precipitation_probability,precipitation,rain,showers,snowfall,weather_code,cloud_cover,wind_speed_10m,wind_direction_10m&timezone=auto&forecast_days={forecast_days}',
    );
    final Map<String, dynamic> $params = <String, dynamic>{
      'latitude': lat,
      'longitude': lon,
      'forecast_days': forecastDays,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<dynamic>, Result<dynamic>>($request);
  }

  @override
  late ChopperClient client;
}
