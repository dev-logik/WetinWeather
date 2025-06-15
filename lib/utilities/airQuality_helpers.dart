import 'package:bloc_app/models/models.dart';
import 'package:flutter/material.dart';

abstract class AirQualityHelperMethods {
  static Color? mapValueToColor(double value) {
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

  static double getAirQualityIndex(AirQualityModel airQualityModel) {
    final aqiValues = (airQualityModel as AirQualityModelService2).aqiList;
    final aqIndex = aqiValues.reduce((val, ref) => (val > ref) ? val : ref);
    return aqIndex;
  }
}
