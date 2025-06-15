import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AirQualityPollutantModel extends Equatable {
  AirQualityPollutantModel({
    required this.pollutantName,
    required this.pollutantConcentration,
    required this.pollutantSymbol,
    this.pollutantUnit = 'µg/m³',
  });

  final String pollutantName;
  final String pollutantSymbol;
  final String pollutantUnit;
  final double pollutantConcentration;

  Color? get mapValueToColor => _mapValueToColor(pollutantConcentration);

  Color? _mapValueToColor(double value) {
    if (value >= 0 && value <= 50) {
      return Colors.green;
    } else if (value > 51 && value <= 100) {
      return Colors.yellow;
    } else if (value > 101 && value <= 150) {
      return Colors.orange;
    } else if (value > 151 && value <= 200) {
      return Colors.redAccent;
    } else if (value > 201 && value <= 300) {
      return Colors.purple;
    }
    return Colors.red[900];
  }

  @override
  // TODO: implement props
  List<Object?> get props => ['pollutantName'];

  @override
  String toString() {
    return 'pollutant name: ${pollutantName} -> pollutant concentration: ${pollutantConcentration} -> pollutant symbol: ${pollutantSymbol} -> pollutant unit: ${pollutantUnit}';
  }
}
