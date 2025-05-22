import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../../utilities/utilities.dart';

class AirQualityParameterCardPortrait extends StatelessWidget {
  const AirQualityParameterCardPortrait({
    super.key,
    required this.parameterName,
    required this.parameterSymbol,
    required this.parameterValue,
  });
  final String parameterName;
  final String parameterSymbol;
  final String parameterValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 0.45.sw, minHeight: 0.17.sh),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0.dm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.dg),
                child: CircularPercentIndicator(
                  radius: isTabletPortrait(context) ? 45.r : 30.r,
                  curve: Curves.easeOutSine,
                  percent: 0.30,
                  progressColor: Colors.greenAccent,
                  startAngle: 180.0,
                  animation: true,
                  center: Text('20'),
                  lineWidth: isTabletPortrait(context) ? 5.w : 2.w,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: parameterSymbol,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isTabletPortrait(context) ? 20.sp : 14.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: parameterName,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                        fontSize: isTabletPortrait(context) ? 20.sp : 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Moderate',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize: isTabletPortrait(context) ? 20.sp : 18.sp,
                    ),
                  ),
                  sizedW8,
                  Container(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.greenAccent,
                    ),
                    height: 5.h,
                    width: 5.w,
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: parameterValue,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' µg/m³',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                        fontSize: isTabletPortrait(context) ? 18.sp : 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              sizedW8,
            ],
          ),
        ),
      ),
    );
  }
}
