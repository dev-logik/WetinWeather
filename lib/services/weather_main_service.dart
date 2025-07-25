import 'package:bloc_app/models/response_model.dart';
import 'package:chopper/chopper.dart';

part 'weather_main_service.chopper.dart';

@ChopperApi()
abstract class MainWeatherService implements ChopperService {
  static MainWeatherService create([ChopperClient? client]) =>
      _$MainWeatherService(client);

  @GET(
    path:
        '/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,surface_pressure,wind_speed_10m,wind_direction_10m,weather_code,rain,showers,snowfall,cloud_cover&wind_speed_unit={wind_speed_unit}&precipitation_unit={precipitation_unit}',
  )
  Future<Response<Result>> getCurrentWeatherDetails({
    @Query('latitude') required double lat,
    @Query('longitude') required double lon,
    @Query('wind_speed_unit') String windSpeedUnit = 'kmh',
    @Query('precipitation_unit') String precipitationUnit = 'mm',
  });

  @GET(
    path:
        '/v1/forecast?latitude={latitude}&longitude={longitude}&hourly=temperature_2m,relative_humidity_2m,dew_point_2m,apparent_temperature,precipitation_probability,precipitation,rain,showers,snowfall,weather_code,cloud_cover,wind_speed_10m,wind_direction_10m&timezone=auto&forecast_days={forecast_days}',
  )
  Future<Response<Result>> getHourlyWeatherForecast({
    @Query('latitude') required double lat,
    @Query('longitude') required double lon,
    @Query('forecast_days') int forecastDays = 1,
  });
}
