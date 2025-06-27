import 'package:bloc_app/services/response_model.dart';
import 'package:chopper/chopper.dart';

part 'air_quality_main_service.chopper.dart';

@ChopperApi()
abstract class AirQualityMainService extends ChopperService {
  static AirQualityMainService create([ChopperClient? client]) =>
      _$AirQualityMainService(client);

  @GET(
    path:
        'v1/air-quality?latitude={latitude}&longitude={longitude}&current=pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide,ozone&timezone=auto',
  )
  Future<Response<Result>> getCurrentAirQualityDetails(
    @Query('longitude') double longitude,
    @Query('latitude') double latitude,
  );
}
