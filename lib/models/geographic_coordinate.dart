import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'geographic_coordinate.freezed.dart';

@unfreezed
class GeographicCoordinateModel with _$GeographicCoordinateModel {
  factory GeographicCoordinateModel({
    required double latitude,
    required double longitude,
    @Default(null) DateTime? timestamp,
    @Default(null) double? accuracy,
  }) = _GeographicCoordinateModel;

  factory GeographicCoordinateModel.fromPosition(Position position) =>
      GeographicCoordinateModel(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: position.timestamp,
        accuracy: position.accuracy,
      );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
