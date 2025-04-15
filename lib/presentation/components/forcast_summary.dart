import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import 'components.dart';

class ForecastSummary extends StatelessWidget {
  const ForecastSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      key: const ValueKey(0),
      constraints: BoxConstraints(
        minHeight: 0.45.sh,
        minWidth: 0.4.sw,
        maxWidth: 0.95.sw,
        maxHeight: 0.48.sh,
      ),
      child: Card(
        color: Color.fromRGBO(225, 225, 225, 225),
        child: Column(
          children: <Widget>[
            displayAnimation(context),
            isTabletPortrait(context) ? Container() : sizedH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                WeatherSummaryParameter(
                  weatherParameterIcon: FontAwesomeIcons.temperatureHalf,
                  weatherParameterName: 'Temperature',
                  weatherParameterValue: 33.toString(),
                  weatherParameterUnit: ' °C',
                ),
                WeatherSummaryParameter(
                  weatherParameterIcon: FontAwesomeIcons.wind,
                  weatherParameterName: 'Wind',
                  weatherParameterUnit: ' m/s',
                  weatherParameterValue: '4',
                ),
                WeatherSummaryParameter(
                  weatherParameterIcon: FontAwesomeIcons.droplet,
                  weatherParameterName: 'Humidity',
                  weatherParameterUnit: ' %',
                  weatherParameterValue: '8',
                ),
              ],
            ),
            sizedH4
          ],
        ),
      ),
    );
  }

  AspectRatio displayAnimation(BuildContext context) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 3 : 4 / 3,
      child: Lottie.asset(
        AssetPath.animatedNightRain,
        height: 300.h,
        width: 300.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
