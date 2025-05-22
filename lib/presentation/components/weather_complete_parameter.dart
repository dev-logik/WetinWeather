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
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData, size: isTabletPortrait(context) ? 45.sp : null),
                sizedW8,
                Text(
                  weatherParameterName,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: isTabletPortrait(context) ? 25.sp : 18.sp,
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
              fontSize: isTabletPortrait(context) ? 35.sp : 24.sp,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: ' $weatherParameterUnit',
                style: textTheme.titleMedium?.copyWith(
                  fontSize: isTabletPortrait(context) ? 27.sp : 16.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
