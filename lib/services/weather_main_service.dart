import 'package:chopper/chopper.dart';

part 'weather_main_service.chopper.dart';

@ChopperApi()
abstract class MainWeatherService implements ChopperService {
  static MainWeatherService create([ChopperClient? client = null]) =>
      _$MainWeatherService(client);

  @GET(
    path:
        '/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,surface_pressure,wind_speed_10m,wind_direction_10m,weather_code,rain,showers,snowfall,cloud_cover&wind_speed_unit={wind_speed_unit}&precipitation_unit={precipitation_unit}&temperature_unit={temp_unit}',
  )
  Future<Response<dynamic>> getCurrentWeatherDetails({
    @Query('latitude') required double lat,
    @Query('longitude') required double lon,
    @Query('wind_speed_unit') String windSpeedUnit = 'Km/hr',
    @Query('precipitation_unit') String precipitationUnit = 'mm',
    @Query('temp_unit') String tempUnit = '°C',
  });
}
