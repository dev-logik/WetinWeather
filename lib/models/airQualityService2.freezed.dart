// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airQualityService2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirQualityModelService2 {

 double get pm10; double get pm2_5; double get carbon_monoxide; double get nitrogen_dioxide; double get sulphur_dioxide; double get ozone;
/// Create a copy of AirQualityModelService2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityModelService2CopyWith<AirQualityModelService2> get copyWith => _$AirQualityModelService2CopyWithImpl<AirQualityModelService2>(this as AirQualityModelService2, _$identity);

  /// Serializes this AirQualityModelService2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityModelService2&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.pm2_5, pm2_5) || other.pm2_5 == pm2_5)&&(identical(other.carbon_monoxide, carbon_monoxide) || other.carbon_monoxide == carbon_monoxide)&&(identical(other.nitrogen_dioxide, nitrogen_dioxide) || other.nitrogen_dioxide == nitrogen_dioxide)&&(identical(other.sulphur_dioxide, sulphur_dioxide) || other.sulphur_dioxide == sulphur_dioxide)&&(identical(other.ozone, ozone) || other.ozone == ozone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide,ozone);

@override
String toString() {
  return 'AirQualityModelService2(pm10: $pm10, pm2_5: $pm2_5, carbon_monoxide: $carbon_monoxide, nitrogen_dioxide: $nitrogen_dioxide, sulphur_dioxide: $sulphur_dioxide, ozone: $ozone)';
}


}

/// @nodoc
abstract mixin class $AirQualityModelService2CopyWith<$Res>  {
  factory $AirQualityModelService2CopyWith(AirQualityModelService2 value, $Res Function(AirQualityModelService2) _then) = _$AirQualityModelService2CopyWithImpl;
@useResult
$Res call({
 double pm10, double pm2_5, double carbon_monoxide, double nitrogen_dioxide, double sulphur_dioxide, double ozone
});




}
/// @nodoc
class _$AirQualityModelService2CopyWithImpl<$Res>
    implements $AirQualityModelService2CopyWith<$Res> {
  _$AirQualityModelService2CopyWithImpl(this._self, this._then);

  final AirQualityModelService2 _self;
  final $Res Function(AirQualityModelService2) _then;

/// Create a copy of AirQualityModelService2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pm10 = null,Object? pm2_5 = null,Object? carbon_monoxide = null,Object? nitrogen_dioxide = null,Object? sulphur_dioxide = null,Object? ozone = null,}) {
  return _then(_self.copyWith(
pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,pm2_5: null == pm2_5 ? _self.pm2_5 : pm2_5 // ignore: cast_nullable_to_non_nullable
as double,carbon_monoxide: null == carbon_monoxide ? _self.carbon_monoxide : carbon_monoxide // ignore: cast_nullable_to_non_nullable
as double,nitrogen_dioxide: null == nitrogen_dioxide ? _self.nitrogen_dioxide : nitrogen_dioxide // ignore: cast_nullable_to_non_nullable
as double,sulphur_dioxide: null == sulphur_dioxide ? _self.sulphur_dioxide : sulphur_dioxide // ignore: cast_nullable_to_non_nullable
as double,ozone: null == ozone ? _self.ozone : ozone // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AirQualityModelService2 implements AirQualityModelService2 {
  const _AirQualityModelService2({required this.pm10, required this.pm2_5, required this.carbon_monoxide, required this.nitrogen_dioxide, required this.sulphur_dioxide, required this.ozone});
  factory _AirQualityModelService2.fromJson(Map<String, dynamic> json) => _$AirQualityModelService2FromJson(json);

@override final  double pm10;
@override final  double pm2_5;
@override final  double carbon_monoxide;
@override final  double nitrogen_dioxide;
@override final  double sulphur_dioxide;
@override final  double ozone;

/// Create a copy of AirQualityModelService2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityModelService2CopyWith<_AirQualityModelService2> get copyWith => __$AirQualityModelService2CopyWithImpl<_AirQualityModelService2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityModelService2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityModelService2&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.pm2_5, pm2_5) || other.pm2_5 == pm2_5)&&(identical(other.carbon_monoxide, carbon_monoxide) || other.carbon_monoxide == carbon_monoxide)&&(identical(other.nitrogen_dioxide, nitrogen_dioxide) || other.nitrogen_dioxide == nitrogen_dioxide)&&(identical(other.sulphur_dioxide, sulphur_dioxide) || other.sulphur_dioxide == sulphur_dioxide)&&(identical(other.ozone, ozone) || other.ozone == ozone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,sulphur_dioxide,ozone);

@override
String toString() {
  return 'AirQualityModelService2(pm10: $pm10, pm2_5: $pm2_5, carbon_monoxide: $carbon_monoxide, nitrogen_dioxide: $nitrogen_dioxide, sulphur_dioxide: $sulphur_dioxide, ozone: $ozone)';
}

  @override
  // TODO: implement aqiList
  List<double> get aqiList => aqiList;

}

/// @nodoc
abstract mixin class _$AirQualityModelService2CopyWith<$Res> implements $AirQualityModelService2CopyWith<$Res> {
  factory _$AirQualityModelService2CopyWith(_AirQualityModelService2 value, $Res Function(_AirQualityModelService2) _then) = __$AirQualityModelService2CopyWithImpl;
@override @useResult
$Res call({
 double pm10, double pm2_5, double carbon_monoxide, double nitrogen_dioxide, double sulphur_dioxide, double ozone
});




}
/// @nodoc
class __$AirQualityModelService2CopyWithImpl<$Res>
    implements _$AirQualityModelService2CopyWith<$Res> {
  __$AirQualityModelService2CopyWithImpl(this._self, this._then);

  final _AirQualityModelService2 _self;
  final $Res Function(_AirQualityModelService2) _then;

/// Create a copy of AirQualityModelService2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pm10 = null,Object? pm2_5 = null,Object? carbon_monoxide = null,Object? nitrogen_dioxide = null,Object? sulphur_dioxide = null,Object? ozone = null,}) {
  return _then(_AirQualityModelService2(
pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,pm2_5: null == pm2_5 ? _self.pm2_5 : pm2_5 // ignore: cast_nullable_to_non_nullable
as double,carbon_monoxide: null == carbon_monoxide ? _self.carbon_monoxide : carbon_monoxide // ignore: cast_nullable_to_non_nullable
as double,nitrogen_dioxide: null == nitrogen_dioxide ? _self.nitrogen_dioxide : nitrogen_dioxide // ignore: cast_nullable_to_non_nullable
as double,sulphur_dioxide: null == sulphur_dioxide ? _self.sulphur_dioxide : sulphur_dioxide // ignore: cast_nullable_to_non_nullable
as double,ozone: null == ozone ? _self.ozone : ozone // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
