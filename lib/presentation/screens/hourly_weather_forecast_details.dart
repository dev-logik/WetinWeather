import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_ball/liquid_ball.dart';
import 'package:lottie/lottie.dart';

import '../../models/models.dart';

class HourlyWeatherForecastDetails extends StatelessWidget {
  final HourlyWeatherForecastModel hourlyForecast;

  const HourlyWeatherForecastDetails({super.key, required this.hourlyForecast});

  @override
  Widget build(BuildContext context) {
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          primary: true,
          slivers: [
            _expandibleAppBar(isLightThemed, textTheme),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                _precipitationCard(textTheme),
                _windDataCard(textTheme),
                _atmosphericMoistureCard(textTheme),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _atmosphericMoistureCard(TextTheme textTheme) {
    return SizedBox(
      width: .9.sw,
      height: .4.sh,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.dg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Atmos. Moisture', style: textTheme.bodyMedium),
                    Text('% - °C', style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Transform.scale(
                scale: 6.dg,
                child: Lottie.asset(
                  AssetPath.waterDrop,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                  animate: true,
                  repeat: true,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.dg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Rel. Humidity: ',
                        style: textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
                        children: [
                          TextSpan(
                            text:
                                '${hourlyForecast.relativeHumidity.toStringAsFixed(2)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Dew Point: ',
                        style: textTheme.bodyMedium?.copyWith(fontSize: 18.sp),

                        children: [
                          TextSpan(
                            text:
                                '${hourlyForecast.dewPoint.toStringAsFixed(2)}°',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _windDataCard(TextTheme textTheme) {
    return SizedBox(
      width: .9.sw,
      height: .4.sh,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.dg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wind', style: textTheme.bodyMedium),
                    Text('km/h', style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Transform.scale(
                scale: 6.dg,
                child: Lottie.asset(
                  AssetPath.windyTree,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                  animate: true,
                  repeat: true,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.dg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Speed: ',
                        style: textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
                        children: [
                          TextSpan(
                            text:
                                '${hourlyForecast.windSpeed.toStringAsFixed(2)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Direction: ',
                        style: textTheme.bodyMedium?.copyWith(fontSize: 18.sp),

                        children: [
                          TextSpan(
                            text:
                                '${WeatherHelpers.getWindDirectionAbbr(hourlyForecast.windDirection)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _precipitationCard(TextTheme textTheme) {
    return SizedBox(
      width: .9.sw,
      height: .4.sh,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.dg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Precipitation', style: textTheme.bodyMedium),
                    Text('mm/day', style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                LiquidBallWidget(
                  containerSize: 200.dg,
                  animationDuration: Duration(milliseconds: 2000),
                  waveGradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 128, 128, 1.0),
                      Color.fromRGBO(240, 248, 255, 1.0),
                    ],
                  ),
                  containerBorder: Border.all(
                    color: Colors.greenAccent,
                    width: 5.w,
                  ),
                  percentage: WeatherHelpers.precipitationRatio(
                    hourlyForecast.precipitation,
                  ),
                ),

                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${hourlyForecast.precipitation.toStringAsFixed(2)}',
                      style: textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Text(
                '${WeatherHelpers.interpretPrecipitationProbability(hourlyForecast.precipitationProb)} ',
                style: textTheme.bodyMedium,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.dg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Rain: ',
                        style: textTheme.bodyMedium,

                        children: [
                          TextSpan(
                            text: '${hourlyForecast.rain.toStringAsFixed(2)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Showers: ',
                        style: textTheme.bodyMedium,

                        children: [
                          TextSpan(
                            text:
                                '${hourlyForecast.showers.toStringAsFixed(2)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Snowfall: ',
                        style: textTheme.bodyMedium,

                        children: [
                          TextSpan(
                            text:
                                '${hourlyForecast.snowFall.toStringAsFixed(2)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _expandibleAppBar(bool isLightThemed, TextTheme textTheme) {
    return SliverAppBar(
      pinned: false,
      centerTitle: true,
      stretch: true,
      expandedHeight: 0.3.sh,
      elevation: 10,
      backgroundColor:
          (isLightThemed)
              ? LightColorConstants.primaryColor
              : DarkColorConstants.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
      shadowColor:
          (isLightThemed)
              ? DarkColorConstants.primaryColor
              : LightColorConstants.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          '${formatHourlyTime(hourlyForecast.getDateTime)}',
          style: textTheme.displaySmall,
        ),
        centerTitle: true,
        background: _temperatureDataCard(textTheme),
      ),
    );
  }

  Card _temperatureDataCard(TextTheme textTheme) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          sizedH8,
          Flexible(
            child: Lottie.asset(
              WeatherHelpers.WeatherCodeToAnimation(
                weatherCode: hourlyForecast.weatherCode,
                isDay: isThisDay(hourlyForecast.getDateTime),
              ),
              height: 100.h,
              width: 100.w,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          '${hourlyForecast.temperature.toStringAsFixed(0)}°',
                          style: textTheme.displayMedium?.copyWith(
                            fontSize: 60.sp,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${WeatherHelpers.getWeatherRemark(hourlyForecast.weatherCode)}',
                          style: textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 80,
                    child: VerticalDivider(color: Colors.white, width: 50),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          '${hourlyForecast.realFeel.toStringAsFixed(0)}°',
                          style: textTheme.displayMedium?.copyWith(
                            fontSize: 60.sp,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'is what it feels like',
                          style: textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
