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
      children: [
        //Todo: Check if an icon can replace this.
        //Todo: the values will be passed dynamically.
        FaIcon(
          weatherParameterIcon,
          size: isTabletPortrait(context) ? 40.sp : null,
        ),
        RichText(
          text: TextSpan(
            text: weatherParameterValue,
            style: textTheme.titleMedium?.copyWith(
              fontSize: isTabletPortrait(context) ? 35.sp : 24.sp,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: weatherParameterUnit,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: isTabletPortrait(context) ? 27.sp : 16.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Text(
          weatherParameterName,
          style: textTheme.titleSmall?.copyWith(
            fontSize: isTabletPortrait(context) ? 25.sp : null,
          ),
        ),
      ],
    );
  }
}
