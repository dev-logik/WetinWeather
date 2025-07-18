import 'package:equatable/equatable.dart';

class CurrentWeatherVariableModel extends Equatable {
  final String _jsonName;
  final String _displayName;
  final String _unit;
  final num _value;

  CurrentWeatherVariableModel({
    required String jsonName,
    required String displayName,
    required String unit,
    required num value,
  }) : _jsonName = jsonName,
       _displayName = displayName,
       _unit = unit,
       _value = value;

  String get jsonName => _jsonName;

  String get displayName => _displayName;

  String get unit => _unit;

  num get value => _value;

  @override
  String toString() {
    return '$_displayName: $_value $_unit \n';
  }

  @override
  List<Object?> get props => [_jsonName, _value];
}
