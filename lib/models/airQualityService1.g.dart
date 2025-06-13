// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airQualityService1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AirQualityModelService1 _$AirQualityModelService1FromJson(
  Map<String, dynamic> json,
) => _AirQualityModelService1(
  pm25: (json['pm25'] as num).toDouble(),
  pm10: (json['pm10'] as num).toDouble(),
  o3: (json['o3'] as num).toDouble(),
  no2: (json['no2'] as num).toDouble(),
  so2: (json['so2'] as num).toDouble(),
  co: (json['co'] as num).toDouble(),
);

Map<String, dynamic> _$AirQualityModelService1ToJson(
  _AirQualityModelService1 instance,
) => <String, dynamic>{
  'pm25': instance.pm25,
  'pm10': instance.pm10,
  'o3': instance.o3,
  'no2': instance.no2,
  'so2': instance.so2,
  'co': instance.co,
};
