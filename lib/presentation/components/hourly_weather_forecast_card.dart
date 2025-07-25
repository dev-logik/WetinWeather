import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HourlyWeatherForecastCard extends StatelessWidget {
  final DateTime timeStamp;
  final double tempValue;
  final String tempUnit;
  final int weatherCode;

  const HourlyWeatherForecastCard({
    super.key,
    required this.timeStamp,
    required this.tempValue,
    required this.tempUnit,
    required this.weatherCode,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth:
        isTabletLandscape(context)
            ? 0.26.sw
            : isPhoneLandscape(context)
            ? 0.20.sw
            : 0.45.sw,
        maxHeight:
        isTabletLandscape(context)
            ? 0.40.sh
            : isPhoneLandscape(context)
            ? .30.sh
            : 0.30.sh,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 0, right: 0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: ClipRect(
                    child: displayAnimation(context, weatherCode),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    displayTime(context, textTheme, timeStamp),
                    sizedH8,
                    displayTemp(textTheme, context, tempValue, tempUnit),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RichText displayTemp(TextTheme textTheme,
      BuildContext context,
      double tempValue,
      String tempUnit,) {
    return RichText(
      text: TextSpan(
        text: '${tempValue.toStringAsFixed(2)}',
        style: textTheme.titleLarge?.copyWith(
          fontSize:
          isTabletPortrait(context)
              ? 40.sp
              : isTabletLandscape(context)
              ? 40.sp
              : isPhoneLandscape(context)
              ? 28.sp
              : 24.sp,
          fontWeight: FontWeight.w100,
          color: Colors.white,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: ' ${tempUnit}',
            style: textTheme.titleLarge?.copyWith(
              fontSize:
              isTabletPortrait(context)
                  ? 30.sp
                  : isTabletLandscape(context)
                  ? 28.sp
                  : isPhoneLandscape(context)
                  ? 18.sp
                  : 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Text displayTime(BuildContext context,
      TextTheme textTheme,
      DateTime timeStamp,) {
    return Text(
      '${formatHourlyTime(timeStamp)}',
      style: textTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontSize:
        isTabletPortrait(context)
            ? 40.sp
            : isTabletLandscape(context)
            ? 35.sp
            : 18.sp,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  AspectRatio displayAnimation(BuildContext context, int weatherCode) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 4 : 1,
      child: Lottie.asset(
        WeatherHelpers.WeatherCodeToAnimation(
          weatherCode: weatherCode,
          isDay: 1,
        ),
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}
