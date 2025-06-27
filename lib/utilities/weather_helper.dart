import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class WeatherHelpers {
  static String WeatherCodeToAnimation({
    required int weatherCode,
    required int isDay,
  }) {
    final isPartlyCloudy = weatherCode == 1 || weatherCode == 2;
    final isFoggy = weatherCode == 45 || weatherCode == 48;
    final isDrizzle =
        weatherCode == 51 ||
        weatherCode == 53 ||
        weatherCode == 55 ||
        weatherCode == 56 ||
        weatherCode == 57;
    final isRain =
        weatherCode == 61 ||
        weatherCode == 63 ||
        weatherCode == 65 ||
        weatherCode == 66 ||
        weatherCode == 67;
    final isSnow =
        weatherCode == 71 ||
        weatherCode == 73 ||
        weatherCode == 75 ||
        weatherCode == 77 ||
        weatherCode == 85 ||
        weatherCode == 86;
    final isThunderstorm =
        weatherCode == 95 || weatherCode == 96 || weatherCode == 99;
    final isShowers =
        weatherCode == 80 || weatherCode == 81 || weatherCode == 82;

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

    if (isDay == 1 && isFoggy) {
      return AssetPath.animatedFoggySunny;
    }

    if (isDay == 0 && isFoggy) {
      return AssetPath.animatedFoggyNight;
    }

    if (isDay == 1 && isDrizzle) {
      return AssetPath.animatedDrizzleDay;
    }

    if (isDay == 0 && isDrizzle) {
      return AssetPath.animatedDrizzleNight;
    }

    if (isDay == 1 && isRain) {
      return AssetPath.animatedSunnyRain;
    }

    if (isDay == 0 && isRain) {
      return AssetPath.animatedNightRain;
    }

    if (isDay == 1 && isSnow) {
      return AssetPath.animatedSunSnowy;
    }

    if (isDay == 0 && isSnow) {
      return AssetPath.animatedNightSnowy;
    }

    if (isDay == 1 && isShowers) {
      return AssetPath.animatedShowersDay;
    }

    if (isDay == 0 && isShowers) {
      return AssetPath.animatedShowersNight;
    }

    if (isDay == 1 && isThunderstorm) {
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
      case 'wind_direction_10m':
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
      case 'cloud_cover':
        return FontAwesomeIcons.cloud;
      default:
        return null;
    }
  }

  static String getWeatherRemark(int wmoCode) {
    switch (wmoCode) {
      // Clear & Cloudy
      case 0:
        return "Sunny";
      case 1:
        return "Mainly clear";
      case 2:
        return "Partly cloudy";
      case 3:
        return "Overcast";

      // Fog
      case 45:
        return "Fog 🌫";
      case 48:
        return "Freezing fog";

      // Drizzle
      case 51:
        return "Light drizzle";
      case 53:
        return "Moderate drizzle";
      case 55:
        return "Heavy drizzle";
      case 56:
      case 57:
        return "Freezing drizzle";

      // Rain
      case 61:
        return "Light rain";
      case 63:
        return "Moderate rain";
      case 65:
        return "Heavy rain";
      case 66:
      case 67:
        return "Freezing rain";

      // Snow
      case 71:
        return "Light snow";
      case 73:
        return "Moderate snow";
      case 75:
        return "Heavy snow";
      case 77:
        return "Snow grains";

      // Showers
      case 80:
        return "Light rain showers";
      case 81:
        return "Moderate rain showers";
      case 82:
        return "Heavy rain showers";
      case 85:
        return "Snow showers";
      case 86:
        return "Heavy snow showers";

      // Thunderstorms
      case 95:
        return "Thunderstorm";
      case 96:
        return "Thunderstorm with hail";
      case 99:
        return "Severe thunderstorm";

      default:
        return "Unknown weather"; // Fallback for undefined codes
    }
  }

  static String getCloudCoverRemark(int cloudCoverPercent) {
    // Handle invalid inputs (outside 0–100)
    if (cloudCoverPercent < 0 || cloudCoverPercent > 100) {
      debugPrint("⚠️ Invalid cloud cover: $cloudCoverPercent%");
      return "Invalid cloud data";
    }

    // Categorize based on WMO-like thresholds
    if (cloudCoverPercent <= 10) {
      return "Clear";
    } else if (cloudCoverPercent <= 25) {
      return "Few clouds";
    } else if (cloudCoverPercent <= 50) {
      return "Partly cloudy";
    } else if (cloudCoverPercent <= 90) {
      return "Mostly cloudy";
    } else {
      return "Overcast";
    }
  }

  static String getIsDayRemarks(int isDay) {
    if (isDay != 0 && isDay != 1) {
      return 'Wrong input';
    } else if (isDay == 1) {
      return 'Day';
    } else {
      return 'Night 🌚';
    }
  }

  static IconData? getWeatherIcon(int? wmoCode) {
    if (wmoCode == null) return FontAwesomeIcons.question;

    switch (wmoCode) {
      // Clear & Cloudy
      case 0:
        return FontAwesomeIcons.sun;
      case 1:
        return FontAwesomeIcons.cloudSun;
      case 2:
        return FontAwesomeIcons.cloud;
      case 3:
        return FontAwesomeIcons.cloud;

      // Fog
      case 45:
      case 48:
        return FontAwesomeIcons.smog;

      // Drizzle
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
        return FontAwesomeIcons.cloudRain;

      // Rain
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        return FontAwesomeIcons.cloudShowersHeavy;

      // Snow
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return FontAwesomeIcons.snowflake;

      // Thunderstorms
      case 95:
      case 96:
      case 99:
        return FontAwesomeIcons.bolt;

      // Default (unknown)
      default:
        return FontAwesomeIcons.question;
    }
  }

  //Get compass abbreviation (e.g., "N", "SE")
  static String getWindDirectionAbbr(int? degrees) {
    if (degrees == null) return "?";
    const dirs = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"];
    final normalized = (degrees % 360 + 22.5) % 360;
    return dirs[(normalized ~/ 45) % 8];
  }
}
