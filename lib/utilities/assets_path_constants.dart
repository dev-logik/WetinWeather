class AssetPath {
  AssetPath._();
  //Path constants to the animated files.
  static final animatedSunny = "assets/animations/sunny.json";
  static final animatedSunnyCloudy = 'assets/animations/sunnycloudy.json';
  static final animatedSunnyRain = 'assets/animations/sunnyrain.json';
  static final animatedSunSnowy = 'assets/animations/sunsowy.json';
  static final animatedClearNight = 'assets/animations/clearnight.json';
  static final animatedCloudy = 'assets/animations/cloudy.json';
  static final animatedCloudyLighting = 'assets/animations/cloudylighting.json';
  static final animatedCloudyWindy = 'assets/animations/cloudywindy.json';
  static final animatedNightRain = 'assets/animations/night and raining.json';
  static final animatedNightCloudy = 'assets/animations/nightcloudy.json';
  static final animatedNightSnowy = 'assets/animations/nightsnowy.json';
  static final animatedSnowy = 'assets/animations/snowy.json';
  static final animatedPartlyCloudyNight =
      'assets/animations/animatedCloudyNight.json';
  static final animatedPartlyCloudyDay =
      'assets/animations/animatedCloudySunny.json';
  static final animatedFoggyNight = 'assets/animations/animatedFoggyNight.json';
  static final animatedFoggySunny = 'assets/animations/animatedFoggySunny.json';
  static final animatedDrizzleDay = 'assets/animations/animatedDrizzleDay.json';
  static final animatedDrizzleNight =
      'assets/animations/animatedDrizzleNight.json';
  static final animatedThunderstormWithRain =
      'assets/animations/animatedThunderstormWithRain.json';
  static final animatedThunderRainDay =
      'assets/animations/animatedThunderRainDay.json';
  static final animatedThunderRainNight =
      'assets/animations/animatedThunderRainNight.json';
  static final animatedLightRainDay = 'assets/animations/sunnyrainlight.json';
  static final animatedShowersNight =
      'assets/animations/animatedShowersNight.json';
  static final animatedShowersDay = 'assets/animations/animatedShowersDay.json';

  //Path constants to the icons
  static final coIcon = 'assets/icons/co.png';
  static final o3Icon = 'assets/icons/o3.png';
  static final pm25Icon = 'assets/icons/pm2_5.png';
  static final so2Icon = 'assets/icons/so2.png';

  //Map pollutant name to the its respective icon path.
  static String mapPollutantToIcon(String pollutantSymbol) {
    switch (pollutantSymbol) {
      case 'CO':
        return AssetPath.coIcon;
      case 'O₃':
        return AssetPath.o3Icon;
      case 'PM25':
        return AssetPath.pm25Icon;
      default:
        return '';
    }
  }
}
