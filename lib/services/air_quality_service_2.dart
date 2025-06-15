import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:chopper/chopper.dart';

part 'air_quality_service_2.chopper.dart';

@ChopperApi()
abstract class AirQualityService_2 extends ChopperService {
  static AirQualityService_2 create([ChopperClient? client]) =>
      _$AirQualityService_2(client);

  @GET(
    path:
        'v1/air-quality?latitude={latitude}&longitude={longitude}&current=pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide,ozone&timezone=auto&forecast_days={forecast_days}',
  )
  Future<Response<List<AirQualityPollutantModel>>> getCurrentAirQualityDetails(
    @Query('longitude') double longitude,
    @Query('latitude') double latitude,
    @Query('forecast_days') int forecastDays,
  );
}
