class WeatherForecastVariableModel {
  final String _actualName;
  final String _displayName;
  final String _unit;
  final num _value;

  const WeatherForecastVariableModel({
    required String jsonName,
    required String displayName,
    required String unit,
    required num value,
  }) : _displayName = displayName,
       _actualName = displayName,
       _unit = unit,
       _value = value;

  String get jsonName => _actualName;
  String get displayName => _displayName;
  String get unit => _unit;
  num get value => _value;
}
