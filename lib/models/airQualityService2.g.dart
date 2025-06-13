// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airQualityService2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AirQualityModelService2 _$AirQualityModelService2FromJson(
  Map<String, dynamic> json,
) => _AirQualityModelService2(
  pm10: (json['pm10'] as num).toDouble(),
  pm2_5: (json['pm2_5'] as num).toDouble(),
  carbon_monoxide: (json['carbon_monoxide'] as num).toDouble(),
  nitrogen_dioxide: (json['nitrogen_dioxide'] as num).toDouble(),
  sulphur_dioxide: (json['sulphur_dioxide'] as num).toDouble(),
  ozone: (json['ozone'] as num).toDouble(),
);

Map<String, dynamic> _$AirQualityModelService2ToJson(
  _AirQualityModelService2 instance,
) => <String, dynamic>{
  'pm10': instance.pm10,
  'pm2_5': instance.pm2_5,
  'carbon_monoxide': instance.carbon_monoxide,
  'nitrogen_dioxide': instance.nitrogen_dioxide,
  'sulphur_dioxide': instance.sulphur_dioxide,
  'ozone': instance.ozone,
};
