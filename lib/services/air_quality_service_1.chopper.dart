// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_service_1.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AirQualityService_1 extends AirQualityService_1 {
  _$AirQualityService_1([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AirQualityService_1;

  @override
  Future<Response<Map<String, dynamic>>> getAirQualityDetails(
    double longitude,
    double latitude,
  ) {
    final Uri $url = Uri.parse(
      'https://api.waqi.info/feed/geo:${latitude};${longitude}/',
    );
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
