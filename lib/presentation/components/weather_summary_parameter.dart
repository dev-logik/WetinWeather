import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherSummaryParameter extends StatelessWidget {
  const WeatherSummaryParameter({
    super.key,
    required this.weatherParameterIcon,
    required this.weatherParameterName,
    required this.weatherParameterUnit,
    required this.weatherParameterValue,
  });

  final IconData weatherParameterIcon;
  final String weatherParameterName;
  final String weatherParameterValue;
  final String weatherParameterUnit;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          weatherParameterIcon,
          size:
              isTabletPortrait(context)
                  ? 40.sp
                  : isPhoneLandscape(context)
                  ? isTabletLandscape(context)
                      ? 30.sp
                      : 24.sp
                  : null,
        ),
        Text(
          weatherParameterValue,
          style: textTheme.titleMedium?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 35.sp
                    : isPhoneLandscape(context)
                    ? isTabletLandscape(context)
                        ? 20.sp
                        : 16.sp
                    : 24.sp,
          ),
        ),
        Text(
          weatherParameterUnit,
          style: textTheme.titleMedium?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 27.sp
                    : isPhoneLandscape(context)
                    ? 12.sp
                    : isTabletLandscape(context)
                    ? 16.sp
                    : 12.sp,
            color: Colors.grey,
          ),
        ),
        Text(
          weatherParameterName,
          style: textTheme.titleSmall?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 25.sp
                    : isPhoneLandscape(context)
                    ? isTabletLandscape(context)
                        ? 20.sp
                        : 14.sp
                    : null,
          ),
        ),
      ],
    );
  }
}
