// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airQualityService1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirQualityModelService1 {

 double get pm25; double get pm10; double get o3; double get no2; double get so2; double get co;
/// Create a copy of AirQualityModelService1
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityModelService1CopyWith<AirQualityModelService1> get copyWith => _$AirQualityModelService1CopyWithImpl<AirQualityModelService1>(this as AirQualityModelService1, _$identity);

  /// Serializes this AirQualityModelService1 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityModelService1&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.o3, o3) || other.o3 == o3)&&(identical(other.no2, no2) || other.no2 == no2)&&(identical(other.so2, so2) || other.so2 == so2)&&(identical(other.co, co) || other.co == co));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pm25,pm10,o3,no2,so2,co);

@override
String toString() {
  return 'AirQualityModelService1(pm25: $pm25, pm10: $pm10, o3: $o3, no2: $no2, so2: $so2, co: $co)';
}


}

/// @nodoc
abstract mixin class $AirQualityModelService1CopyWith<$Res>  {
  factory $AirQualityModelService1CopyWith(AirQualityModelService1 value, $Res Function(AirQualityModelService1) _then) = _$AirQualityModelService1CopyWithImpl;
@useResult
$Res call({
 double pm25, double pm10, double o3, double no2, double so2, double co
});




}
/// @nodoc
class _$AirQualityModelService1CopyWithImpl<$Res>
    implements $AirQualityModelService1CopyWith<$Res> {
  _$AirQualityModelService1CopyWithImpl(this._self, this._then);

  final AirQualityModelService1 _self;
  final $Res Function(AirQualityModelService1) _then;

/// Create a copy of AirQualityModelService1
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pm25 = null,Object? pm10 = null,Object? o3 = null,Object? no2 = null,Object? so2 = null,Object? co = null,}) {
  return _then(_self.copyWith(
pm25: null == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double,pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,o3: null == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as double,no2: null == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as double,so2: null == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as double,co: null == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AirQualityModelService1 implements AirQualityModelService1 {
  const _AirQualityModelService1({required this.pm25, required this.pm10, required this.o3, required this.no2, required this.so2, required this.co});
  factory _AirQualityModelService1.fromJson(Map<String, dynamic> json) => _$AirQualityModelService1FromJson(json);

@override final  double pm25;
@override final  double pm10;
@override final  double o3;
@override final  double no2;
@override final  double so2;
@override final  double co;

/// Create a copy of AirQualityModelService1
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityModelService1CopyWith<_AirQualityModelService1> get copyWith => __$AirQualityModelService1CopyWithImpl<_AirQualityModelService1>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityModelService1ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityModelService1&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.o3, o3) || other.o3 == o3)&&(identical(other.no2, no2) || other.no2 == no2)&&(identical(other.so2, so2) || other.so2 == so2)&&(identical(other.co, co) || other.co == co));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pm25,pm10,o3,no2,so2,co);

@override
String toString() {
  return 'AirQualityModelService1(pm25: $pm25, pm10: $pm10, o3: $o3, no2: $no2, so2: $so2, co: $co)';
}


}

/// @nodoc
abstract mixin class _$AirQualityModelService1CopyWith<$Res> implements $AirQualityModelService1CopyWith<$Res> {
  factory _$AirQualityModelService1CopyWith(_AirQualityModelService1 value, $Res Function(_AirQualityModelService1) _then) = __$AirQualityModelService1CopyWithImpl;
@override @useResult
$Res call({
 double pm25, double pm10, double o3, double no2, double so2, double co
});




}
/// @nodoc
class __$AirQualityModelService1CopyWithImpl<$Res>
    implements _$AirQualityModelService1CopyWith<$Res> {
  __$AirQualityModelService1CopyWithImpl(this._self, this._then);

  final _AirQualityModelService1 _self;
  final $Res Function(_AirQualityModelService1) _then;

/// Create a copy of AirQualityModelService1
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pm25 = null,Object? pm10 = null,Object? o3 = null,Object? no2 = null,Object? so2 = null,Object? co = null,}) {
  return _then(_AirQualityModelService1(
pm25: null == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double,pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,o3: null == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as double,no2: null == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as double,so2: null == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as double,co: null == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
