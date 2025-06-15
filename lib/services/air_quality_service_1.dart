import 'dart:async';

import 'package:chopper/chopper.dart';

part 'air_quality_service_1.chopper.dart';

@ChopperApi()
abstract class AirQualityService_1 extends ChopperService {
  static AirQualityService_1 create([ChopperClient? client]) =>
      _$AirQualityService_1(client);

  @GET(path: '/feed/geo:{latitude};{longitude}/')
  Future<Response<Map<String, dynamic>>> getAirQualityDetails(
    @Path('longitude') double longitude,
    @Path('latitude') double latitude,
  );
}
