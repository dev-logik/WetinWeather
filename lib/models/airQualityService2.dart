import 'package:bloc_app/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'airQualityService2.freezed.dart';
part 'airQualityService2.g.dart';

@freezed
class AirQualityModelService2 extends AirQualityModel
    with _$AirQualityModelService2 {
  const factory AirQualityModelService2({
    required double pm10,
    required double pm2_5,
    required double carbon_monoxide,
    required double nitrogen_dioxide,
    required double sulphur_dioxide,
    required double ozone,
  }) = _AirQualityModelService2;

  factory AirQualityModelService2.fromJson(Map<String, dynamic> json) =>
      _$AirQualityModelService2FromJson(json);
  late final aqiList = [
    pm10,
    pm2_5,
    carbon_monoxide,
    nitrogen_dioxide,
    sulphur_dioxide,
    ozone,
  ];

  @override
  double get carbon_monoxide => carbon_monoxide;

  @override
  double get nitrogen_dioxide => nitrogen_dioxide;

  @override
  double get ozone => ozone;

  @override
  double get pm10 => pm10;

  @override
  double get pm2_5 => pm2_5;

  @override
  double get sulphur_dioxide => sulphur_dioxide;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
