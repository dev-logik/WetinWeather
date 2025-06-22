// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_backup_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AirQualityBackupService extends AirQualityBackupService {
  _$AirQualityBackupService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AirQualityBackupService;

  @override
  Future<Response<dynamic>> getCurrentAirQualityDetails(
    double longitude,
    double latitude,
  ) {
    final Uri $url = Uri.parse('/feed/geo:${latitude};${longitude}/');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
