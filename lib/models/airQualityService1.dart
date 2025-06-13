import 'package:freezed_annotation/freezed_annotation.dart';

part 'airQualityService1.freezed.dart';
part 'airQualityService1.g.dart';

@freezed
class AirQualityModelService1 with _$AirQualityModelService1 {
  const factory AirQualityModelService1({
    required double pm25,
    required double pm10,
    required double o3,
    required double no2,
    required double so2,
    required double co,
  }) = _AirQualityModelService1;

  factory AirQualityModelService1.fromJson(Map<String, dynamic> json) =>
      _$AirQualityModelService1FromJson(json);

  @override
  double get co => co;

  @override
  double get no2 => no2;

  @override
  double get o3 => o3;

  @override
  double get pm10 => pm10;

  @override
  double get pm25 => pm25;

  @override
  double get so2 => so2;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
