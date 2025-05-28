import 'package:bloc_app/utilities/orientation_helpers.dart';
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
          width: isTabletPortrait(context) ? 60.w : 30.w,
          height: isTabletPortrait(context) ? 60.h : 30.h,
          color: (aqParameterName == 'Carbon 1') ? Colors.white : null,
        ),
        RichText(
          text: TextSpan(
            text: aqParameterValue,
            style: textTheme.titleMedium?.copyWith(
              fontSize:
                  isTabletPortrait(context)
                      ? 35.sp
                      : isPhoneLandscape(context)
                      ? 16.sp
                      : 24.sp,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: aqParameterUnit,
                style: textTheme.titleMedium?.copyWith(
                  fontSize:
                      isTabletPortrait(context)
                          ? 27.sp
                          : isPhoneLandscape(context)
                          ? 12.sp
                          : 16.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Text(
          aqParameterName,
          style: textTheme.titleSmall?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 25.sp
                    : isPhoneLandscape(context)
                    ? 14.sp
                    : null,
          ),
        ),
      ],
    );
  }
}
