import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../../utilities/utilities.dart';

class AirQualityPollutantIndividualCard extends StatelessWidget {
  const AirQualityPollutantIndividualCard({
    super.key,
    required this.pollutantName,
    required this.pollutantSymbol,
    required this.pollutantConcentration,
    required this.pollutantUnit,
    required this.relativeConcentration,
    required this.indicatorColor,
    required this.remark,
  });
  final String? pollutantName;
  final String? pollutantSymbol;
  final double? pollutantConcentration;
  final double? relativeConcentration;
  final String? pollutantUnit;
  final Color? indicatorColor;
  final String? remark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    final isDeviceInLandscape =
        (isPhoneLandscape(context) || isTabletLandscape(context));
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 0.45.sw, minHeight: 0.17.sh),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(
            isTabletPortrait(context)
                ? 12.0.dg
                : isTabletLandscape(context)
                ? 18.dg
                : isPhoneLandscape(context)
                ? 14.dg
                : 8.dg,
          ),
          child:
              (isDeviceInLandscape)
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: aqiInformation(
                          textTheme,
                          context,
                          isDeviceInLandscape,
                        ),
                      ),

                      Flexible(
                        child: aqiPercentageIndicator(
                          context,
                          textTheme,
                          isLightThemed,
                        ),
                      ),
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: aqiPercentageIndicator(
                          context,
                          textTheme,
                          isLightThemed,
                        ),
                      ),
                      Flexible(
                        child: aqiInformation(
                          textTheme,
                          context,
                          isDeviceInLandscape,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  Column aqiInformation(
    TextTheme textTheme,
    BuildContext context,
    bool isDeviceInLandscape,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          (isDeviceInLandscape)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: pollutantSymbol,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize:
                  isTabletPortrait(context)
                      ? 24.sp
                      : isTabletLandscape(context)
                      ? 28.sp
                      : isPhoneLandscape(context)
                      ? 16.sp
                      : 12.sp,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '${pollutantName}',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                  fontSize:
                      isTabletPortrait(context)
                          ? 24.sp
                          : isTabletLandscape(context)
                          ? 28.sp
                          : isPhoneLandscape(context)
                          ? 16.sp
                          : 12.sp,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              isDeviceInLandscape
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
          children: [
            Text(
              remark ?? '',
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w100,
                fontSize:
                    isTabletPortrait(context)
                        ? 24.sp
                        : isTabletLandscape(context)
                        ? 28.sp
                        : isPhoneLandscape(context)
                        ? 20.sp
                        : 18.sp,
              ),
            ),
            sizedW8,
            Container(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: indicatorColor,
              ),
              height: isTabletLandscape(context) ? 10.h : 5.h,
              width: isTabletLandscape(context) ? 10.w : 5.w,
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            text: '${pollutantConcentration}',
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w100,
              //color: Colors.grey,
              fontSize:
                  isTabletPortrait(context)
                      ? 20.sp
                      : isTabletLandscape(context)
                      ? 24.sp
                      : isPhoneLandscape(context)
                      ? 18.sp
                      : null,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' ${pollutantUnit}',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                  fontSize:
                      isTabletPortrait(context)
                          ? 20.sp
                          : isTabletLandscape(context)
                          ? 22.sp
                          : isPhoneLandscape(context)
                          ? 16.sp
                          : 14.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget aqiPercentageIndicator(
    BuildContext context,
    TextTheme textTheme,
    bool isLightThemed,
  ) {
    return CircularPercentIndicator(
      radius:
          isTabletPortrait(context)
              ? 55.r
              : isTabletLandscape(context)
              ? 60.r
              : isPhoneLandscape(context)
              ? 35.r
              : 34.r,
      curve: Curves.easeOutSine,
      percent: relativeConcentration ?? 0.0,
      progressColor: indicatorColor,
      startAngle: 180.0,
      animation: true,
      center: Text(
        '${(relativeConcentration! * 100).toStringAsFixed(2)}%',
        style: textTheme.bodyMedium?.copyWith(
          fontSize:
              isTabletPortrait(context)
                  ? 20.sp
                  : isPhoneLandscape(context)
                  ? 18.sp
                  : 12.sp,
          color: (isLightThemed) ? Colors.white : Colors.grey,
          fontWeight: isTabletPortrait(context) ? FontWeight.w500 : null,
        ),
      ),
      lineWidth:
          isTabletPortrait(context)
              ? 6.w
              : isTabletLandscape(context)
              ? 5.w
              : isPhoneLandscape(context)
              ? 3.w
              : 4.w,
    );
  }
}
