// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_main_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AirQualityMainService extends AirQualityMainService {
  _$AirQualityMainService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AirQualityMainService;

  @override
  Future<Response<Result>> getCurrentAirQualityDetails(
    double longitude,
    double latitude,
  ) {
    final Uri $url = Uri.parse(
      'v1/air-quality?latitude={latitude}&longitude={longitude}&current=pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide,ozone&timezone=auto',
    );
    final Map<String, dynamic> $params = <String, dynamic>{
      'longitude': longitude,
      'latitude': latitude,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result, dynamic>($request);
  }
}
