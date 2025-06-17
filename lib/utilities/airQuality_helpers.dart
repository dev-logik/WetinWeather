import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:flutter/material.dart';

abstract class AirQualityHelpers {
  static const double _highestAQI = 500;
  static Color? mapValueToColor(double value) {
    if (value <= 50) {
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

  static String? mapValueToRemark(double value) {
    if (value <= 50) {
      return 'Good';
    } else if (value <= 100) {
      return 'Moderate';
    } else if (value <= 150) {
      return 'Unhealthy (Vulnerable)';
    } else if (value <= 200) {
      return 'Unhealthy';
    } else if (value <= 300) {
      return 'Very Unhealthy';
    }
    // value is implicitly > 300
    return 'Hazardous';
  }

  static double? getAirQualityIndex({
    required List<AirQualityPollutantModel> aQModels,
  }) {
    final aqIndex = aQModels.reduce(
      (target, ref) =>
          (target.basePollutantConc > ref.basePollutantConc) ? target : ref,
    );
    return aqIndex.basePollutantConc;
  }

  static double getRelativeConcentration(double? currentValue) {
    return (currentValue ?? 0.0) / _highestAQI;
  }
}
