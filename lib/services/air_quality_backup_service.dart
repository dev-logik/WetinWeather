import 'dart:async';

import 'package:chopper/chopper.dart';

import '../models/response_model.dart';

part 'air_quality_backup_service.chopper.dart';

@ChopperApi()
abstract class AirQualityBackupService extends ChopperService {
  static AirQualityBackupService create([ChopperClient? client]) =>
      _$AirQualityBackupService(client);

  @GET(path: '/feed/geo:{latitude};{longitude}/')
  Future<Response<Result>> getCurrentAirQualityDetails(
    @Path('longitude') double longitude,
    @Path('latitude') double latitude,
  );
}
