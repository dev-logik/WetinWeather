// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_service_2.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AirQualityService_2 extends AirQualityService_2 {
  _$AirQualityService_2([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AirQualityService_2;

  @override
  Future<Response<List<AirQualityPollutantModel>>> getCurrentAirQualityDetails(
    double longitude,
    double latitude,
    int forecastDays,
  ) {
    final Uri $url = Uri.parse(
      'https://air-quality-api.open-meteo.com/v1/air-quality?latitude={latitude}&longitude={longitude}&current=pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide,ozone&timezone=auto&forecast_days={forecast_days}',
    );
    final Map<String, dynamic> $params = <String, dynamic>{
      'longitude': longitude,
      'latitude': latitude,
      'forecast_days': forecastDays,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<AirQualityPollutantModel>, AirQualityPollutantModel>(
          $request,
        );
  }
}
