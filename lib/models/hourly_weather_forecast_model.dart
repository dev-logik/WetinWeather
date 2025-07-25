import 'package:equatable/equatable.dart';

class HourlyWeatherForecastModel extends Equatable {
  final int relativeHumidity;
  final double temperature;
  final double dewPoint;
  final double realFeel;
  final int precipitationProb;
  final double precipitation;
  final double rain;
  final double showers;
  final double snowFall;
  final int weatherCode;
  final int cloudCover;
  final double windSpeed;
  final int windDirection;
  final String time;

  HourlyWeatherForecastModel({
    required this.relativeHumidity,
    required this.temperature,
    required this.dewPoint,
    required this.realFeel,
    required this.precipitationProb,
    required this.precipitation,
    required this.rain,
    required this.showers,
    required this.snowFall,
    required this.weatherCode,
    required this.cloudCover,
    required this.windSpeed,
    required this.windDirection,
    required this.time,
  });

  DateTime get getDateTime => DateTime.parse(time.trim());

  @override
  List<Object?> get props => [time];
}
