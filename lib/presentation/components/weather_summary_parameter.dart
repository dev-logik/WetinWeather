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
          size: isTabletPortrait(context) ? 10.dg : null,
        ),
        RichText(
          text: TextSpan(
            text: weatherParameterValue,
            style: isTabletPortrait(context)
                ? textTheme.titleMedium?.copyWith(fontSize: 15.sp)
                : textTheme.titleMedium?.copyWith(fontSize: 24.sp),
            children: <InlineSpan>[
              TextSpan(
                text: weatherParameterUnit,
                style: isTabletPortrait(context)
                    ? textTheme.titleMedium?.copyWith(fontSize: 15.sp)
                    : textTheme.titleMedium?.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
        Text(
          weatherParameterName,
          style: isTabletPortrait(context)
              ? textTheme.titleMedium?.copyWith(fontSize: 10.sp)
              : null,
        ),
      ],
    );
  }
}
