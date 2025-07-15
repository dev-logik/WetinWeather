import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AirQualityConcUnits { microgramsPerCubicMeter, partsPerBillion }

class CurrentPollutantModel extends Equatable {
  CurrentPollutantModel({
    required String pollutantName,
    required double pollutantConcentration,
    required String pollutantSymbol,
  }) : _pollutantConcentration = pollutantConcentration,
       _pollutantSymbol = pollutantSymbol,
       _pollutantName = pollutantName;

  final String _pollutantName;

  final String _pollutantSymbol;

  final double _pollutantConcentration;

  final Map<String, double> _molecularWeights = {
    "CO": 28.01,
    "SO₂": 64.06,
    "NO₂": 46.01,
    "O₃": 48.00,
  };

  static const double _standardMolarVolumeLitersPerMole = 24.45;
  static const double _highestAQI = 500;

  //Defines the getters for the following class
  String get pollutantName => _pollutantName;

  String get pollutantSymbol => _pollutantSymbol;

  double get pollutantConcentration => _pollutantConcentration;

  double get relativeConc => _getRelativeConcentration(_pollutantConcentration);

  Color? get mapValueToColor => _mapValueToColor(_pollutantConcentration);

  String? get remarks => _mapValueToRemark(_pollutantConcentration);

  //Returns the conc. value in the selected unit.
  double getPollutantConcIn({
    AirQualityConcUnits units = AirQualityConcUnits.microgramsPerCubicMeter,
  }) {
    switch (units) {
      case AirQualityConcUnits.microgramsPerCubicMeter:
        return _pollutantConcentration;
      case AirQualityConcUnits.partsPerBillion:
        return _microgramsToPpb();
    }
  }

  //Converts conc. value from micrograms to ppb.
  double _microgramsToPpb() {
    final exclude = pollutantSymbol == 'PM10' || pollutantSymbol == 'PM25';
    if (exclude) {
      return _pollutantConcentration;
    }
    return (_pollutantConcentration * _standardMolarVolumeLitersPerMole) /
        _molecularWeights[_pollutantSymbol]!;
  }

  //Returns the unit string for the selected conc. value unit.
  String getPollutantUnitStringFor({
    AirQualityConcUnits units = AirQualityConcUnits.microgramsPerCubicMeter,
  }) {
    final exclude = pollutantSymbol == 'PM10' || pollutantSymbol == 'PM25';
    switch (units) {
      case AirQualityConcUnits.microgramsPerCubicMeter:
        return 'µg/m³';
      case AirQualityConcUnits.partsPerBillion:
        //The following pollutants can't be expressed in ppb
        return (exclude) ? 'µg/m³' : 'ppb';
    }
  }

  //maps a concentration value to a color.
  Color? _mapValueToColor(double value) {
    if (value <= 50) {
      // Assuming 0 is the minimum
      return Colors.greenAccent;
    } else if (value <= 100) {
      return Colors.yellowAccent;
    } else if (value <= 150) {
      return Colors.orangeAccent;
    } else if (value <= 200) {
      return Colors.redAccent;
    } else if (value <= 300) {
      return Colors.purpleAccent;
    }
    // value is implicitly > 300
    return Colors.red[900];
  }

  //maps a concentration value to a wordly remark.
  static String? _mapValueToRemark(double value) {
    if (value <= 50) {
      return 'Good';
    } else if (value <= 100) {
      return 'Moderate';
    } else if (value <= 150) {
      return 'Unhealthy (SG)';
    } else if (value <= 200) {
      return 'Unhealthy';
    } else if (value <= 300) {
      return 'Very Unhealthy';
    }
    // value is implicitly > 300
    return 'Hazardous';
  }

  //returns the relative conc. of the pollutant
  static double _getRelativeConcentration(double? currentValue) {
    return (currentValue ?? 0.0) / _highestAQI;
  }

  @override
  String toString() {
    return 'AirQualityPollutantModel(pollutantName: $_pollutantName, pollutantConcentration: $_pollutantConcentration, pollutantSymbol: $_pollutantSymbol)';
  }

  @override
  List<Object?> get props => [_pollutantSymbol, _pollutantConcentration];
}
