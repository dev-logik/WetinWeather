import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/utilities.dart';

class WeatherCompleteParameter extends StatelessWidget {
  const WeatherCompleteParameter({
    super.key,
    required this.iconData,
    required this.weatherParameterName,
    required this.weatherParameterValue,
    required this.weatherParameterUnit,
  });
  final IconData iconData;
  final String weatherParameterName;
  final String weatherParameterValue;
  final String weatherParameterUnit;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  size:
                      isTabletPortrait(context)
                          ? 45.sp
                          : isTabletLandscape(context)
                          ? 50.sp
                          : isPhoneLandscape(context)
                          ? 30.sp
                          : null,
                ),
                sizedW8,
                Text(
                  weatherParameterName,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize:
                        isTabletPortrait(context)
                            ? 25.sp
                            : isTabletLandscape(context)
                            ? 30.sp
                            : isPhoneLandscape(context)
                            ? 20.sp
                            : 18.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: weatherParameterValue,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w100,
              fontSize:
                  isTabletPortrait(context)
                      ? 35.sp
                      : isTabletLandscape(context)
                      ? 40.sp
                      : isPhoneLandscape(context)
                      ? 28.sp
                      : 24.sp,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: ' $weatherParameterUnit',
                style: textTheme.titleMedium?.copyWith(
                  fontSize:
                      isTabletPortrait(context)
                          ? 27.sp
                          : isTabletLandscape(context)
                          ? 30.sp
                          : isPhoneLandscape(context)
                          ? 18.sp
                          : 16.sp,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
