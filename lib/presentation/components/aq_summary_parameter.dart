import 'package:bloc_app/utilities/orientation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AirQualityPollutantSummaryCard extends StatelessWidget {
  const AirQualityPollutantSummaryCard({
    super.key,
    required this.aqIconPath,
    required this.aqParameterName,
    required this.aqParameterValue,
    required this.aqParameterUnit,
  });

  final String? aqIconPath;
  final String? aqParameterName;
  final double? aqParameterValue;
  final String? aqParameterUnit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _showPollutantIcon(context),
        _showPollutantConcentration(textTheme, context),
        _showPollutantName(textTheme, context),
      ],
    );
  }

  Skeletonizer _showPollutantName(TextTheme textTheme, BuildContext context) {
    return Skeletonizer(
      enabled: aqParameterName == null,
      child: Text(
        aqParameterName!,
        style: textTheme.titleSmall?.copyWith(
          fontSize:
              isTabletPortrait(context)
                  ? 25.sp
                  : isPhoneLandscape(context)
                  ? 14.sp
                  : 14.sp,
        ),
      ),
    );
  }

  Widget _showPollutantConcentration(
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${aqParameterValue ?? 0.0}',
          style: textTheme.titleMedium?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 35.sp
                    : isPhoneLandscape(context)
                    ? 16.sp
                    : 24.sp,
          ),
        ),
        Text(
          '${aqParameterUnit}',
          style: textTheme.titleMedium?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 27.sp
                    : isPhoneLandscape(context)
                    ? 10.sp
                    : isTabletLandscape(context)
                    ? 16.sp
                    : 12.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _showPollutantIcon(BuildContext context) {
    return Image.asset(
      aqIconPath!,
      width: isTabletPortrait(context) ? 60.w : 30.w,
      height: isTabletPortrait(context) ? 60.h : 30.h,
      color: (aqParameterName == 'CO Gas') ? Colors.white : null,
    );
  }
}
