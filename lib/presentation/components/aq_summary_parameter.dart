import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AirQualitySummaryParameter extends StatelessWidget {
  const AirQualitySummaryParameter({
    super.key,
    required this.aqIconPath,
    required this.aqParameterName,
    required this.aqParameterValue,
    required this.aqParameterUnit,
  });

  final String aqIconPath;
  final String aqParameterName;
  final String aqParameterValue;
  final String aqParameterUnit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Todo: Check if an icon can replace this.
        //Todo: the values will be passed dynamically.
        Image.asset(
          aqIconPath,
          width: 30.w,
          height: 30.w,
          color: (aqParameterName == 'Carbon 1') ? Colors.white : null,
        ),
        RichText(
          text: TextSpan(
            text: aqParameterValue,
            style: isTabletPortrait(context)
                ? textTheme.titleMedium?.copyWith(fontSize: 12.sp)
                : textTheme.titleMedium?.copyWith(fontSize: 22.sp),
            children: <InlineSpan>[
              TextSpan(
                text: aqParameterUnit,
                style: isTabletPortrait(context)
                    ? textTheme.titleMedium?.copyWith(fontSize: 12.sp)
                    : textTheme.titleMedium?.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
        Text(
          aqParameterName,
          style: isTabletPortrait(context)
              ? textTheme.titleMedium?.copyWith(fontSize: 10.sp)
              : null,
        ),
      ],
    );
  }
}
