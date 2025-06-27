import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class WeatherHelpers {
  static String WeatherCodeToAnimation({
    required int weatherCode,
    required int isDay,
  }) {
    final isPartlyCloudy = weatherCode == 1 || weatherCode == 2;

    if (isDay == 1 && weatherCode == 0) {
      return AssetPath.animatedSunny;
    }

    if (isDay == 0 && weatherCode == 0) {
      return AssetPath.animatedClearNight;
    }

    if (isDay == 1 && isPartlyCloudy) {
      return AssetPath.animatedPartlyCloudyDay;
    }

    if (isDay == 0 && isPartlyCloudy) {
      return AssetPath.animatedPartlyCloudyNight;
    }

    if (isDay == 1 && weatherCode == 3) {
      return AssetPath.animatedSunnyCloudy;
    }

    if (isDay == 0 && weatherCode == 3) {
      return AssetPath.animatedNightCloudy;
    }

    if (isDay == 1 && weatherCode == 4) {
      return AssetPath.animatedFoggySunny;
    }

    if (isDay == 0 && weatherCode == 4) {
      return AssetPath.animatedFoggyNight;
    }

    if (isDay == 1 && weatherCode == 5) {
      return AssetPath.animatedDrizzleDay;
    }

    if (isDay == 0 && weatherCode == 5) {
      return AssetPath.animatedDrizzleNight;
    }

    if (isDay == 1 && weatherCode == 6) {
      return AssetPath.animatedSunnyRain;
    }

    if (isDay == 0 && weatherCode == 6) {
      return AssetPath.animatedNightRain;
    }

    if (isDay == 1 && weatherCode == 7) {
      return AssetPath.animatedSunSnowy;
    }

    if (isDay == 0 && weatherCode == 7) {
      return AssetPath.animatedNightSnowy;
    }

    if (isDay == 1 && weatherCode == 8) {
      return AssetPath.animatedShowersDay;
    }

    if (isDay == 0 && weatherCode == 8) {
      return AssetPath.animatedShowersNight;
    }

    if (isDay == 1 && weatherCode == 9) {
      return AssetPath.animatedThunderRainDay;
    }

    return AssetPath.animatedThunderRainNight;
  }

  static IconData? mapWeatherVariableToIcon(String jsonName) {
    if (jsonName == '') {
      return null;
    }
    switch (jsonName) {
      case 'temperature_2m':
        return FontAwesomeIcons.temperatureHalf;
      case 'relative_humidity_2m':
        return FontAwesomeIcons.droplet;
      case 'wind_speed_10m':
        return FontAwesomeIcons.wind;
      case 'wind_direction':
        return FontAwesomeIcons.compass;
      case 'rain':
        return FontAwesomeIcons.cloudRain;
      case 'snowfall':
        return FontAwesomeIcons.snowflake;
      case 'showers':
        return FontAwesomeIcons.cloudShowersWater;
      case 'surface_pressure':
        return FontAwesomeIcons.gauge;
      case 'precipitation':
        return FontAwesomeIcons.cloudRain;
      default:
        return null;
    }
  }
}
