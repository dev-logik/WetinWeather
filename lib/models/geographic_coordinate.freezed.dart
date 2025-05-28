// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geographic_coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeographicCoordinateModel {

 double get latitude; set latitude(double value); double get longitude; set longitude(double value); DateTime? get timestamp; set timestamp(DateTime? value); double? get accuracy; set accuracy(double? value);
/// Create a copy of GeographicCoordinateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeographicCoordinateModelCopyWith<GeographicCoordinateModel> get copyWith => _$GeographicCoordinateModelCopyWithImpl<GeographicCoordinateModel>(this as GeographicCoordinateModel, _$identity);





@override
String toString() {
  return 'GeographicCoordinateModel(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy)';
}


}

/// @nodoc
abstract mixin class $GeographicCoordinateModelCopyWith<$Res>  {
  factory $GeographicCoordinateModelCopyWith(GeographicCoordinateModel value, $Res Function(GeographicCoordinateModel) _then) = _$GeographicCoordinateModelCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, DateTime? timestamp, double? accuracy
});




}
/// @nodoc
class _$GeographicCoordinateModelCopyWithImpl<$Res>
    implements $GeographicCoordinateModelCopyWith<$Res> {
  _$GeographicCoordinateModelCopyWithImpl(this._self, this._then);

  final GeographicCoordinateModel _self;
  final $Res Function(GeographicCoordinateModel) _then;

/// Create a copy of GeographicCoordinateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? timestamp = freezed,Object? accuracy = freezed,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc


class _GeographicCoordinateModel implements GeographicCoordinateModel {
   _GeographicCoordinateModel({required this.latitude, required this.longitude, this.timestamp = null, this.accuracy = null});
  

@override  double latitude;
@override  double longitude;
@override@JsonKey()  DateTime? timestamp;
@override@JsonKey()  double? accuracy;

/// Create a copy of GeographicCoordinateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeographicCoordinateModelCopyWith<_GeographicCoordinateModel> get copyWith => __$GeographicCoordinateModelCopyWithImpl<_GeographicCoordinateModel>(this, _$identity);





@override
String toString() {
  return 'GeographicCoordinateModel(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy)';
}


}

/// @nodoc
abstract mixin class _$GeographicCoordinateModelCopyWith<$Res> implements $GeographicCoordinateModelCopyWith<$Res> {
  factory _$GeographicCoordinateModelCopyWith(_GeographicCoordinateModel value, $Res Function(_GeographicCoordinateModel) _then) = __$GeographicCoordinateModelCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, DateTime? timestamp, double? accuracy
});




}
/// @nodoc
class __$GeographicCoordinateModelCopyWithImpl<$Res>
    implements _$GeographicCoordinateModelCopyWith<$Res> {
  __$GeographicCoordinateModelCopyWithImpl(this._self, this._then);

  final _GeographicCoordinateModel _self;
  final $Res Function(_GeographicCoordinateModel) _then;

/// Create a copy of GeographicCoordinateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? timestamp = freezed,Object? accuracy = freezed,}) {
  return _then(_GeographicCoordinateModel(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
