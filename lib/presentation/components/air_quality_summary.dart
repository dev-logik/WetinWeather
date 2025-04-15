import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'components.dart';

class AirQualitySummary extends StatelessWidget {
  const AirQualitySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      key: const ValueKey(1),
      constraints: BoxConstraints(
        minHeight: 0.45.sh,
        minWidth: 0.4.sw,
        maxWidth: 0.95.sw,
        maxHeight: 0.5.sh,
      ),
      child: Card(
        color: Color.fromRGBO(225, 225, 225, 225),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            sizedH8,
            displayGuage(context, textTheme),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AirQualitySummaryParameter(
                  aqIconPath: AssetPath.coIcon,
                  aqParameterName: 'Carbon 1',
                  aqParameterUnit: ' µmm/g',
                  aqParameterValue: 5.0.toString(),
                ),
                AirQualitySummaryParameter(
                  aqIconPath: AssetPath.pm25Icon,
                  aqParameterName: 'PM 2.5',
                  aqParameterValue: '100',
                  aqParameterUnit: ' µmm/g',
                ),
                AirQualitySummaryParameter(
                  aqIconPath: AssetPath.o3Icon,
                  aqParameterName: 'Ozone',
                  aqParameterValue: '2.5',
                  aqParameterUnit: ' µmm/g',
                ),
              ],
            ),
            // sizedH8,
          ],
        ),
      ),
    );
  }

  AspectRatio displayGuage(BuildContext context, TextTheme textTheme) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 3 : 4 / 3,
      child: SfRadialGauge(
        animationDuration: 500,
        //enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 500,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 50,
                label: 'Good',
                color: Colors.green,
              ),
              GaugeRange(
                startValue: 51,
                endValue: 100,
                label: 'Moderate',
                color: Colors.lightGreen,
              ),
              GaugeRange(
                startValue: 101,
                endValue: 200,
                label: 'Unhealthy',
                color: Colors.lightGreenAccent,
              ),
              GaugeRange(
                startValue: 201,
                endValue: 300,
                label: 'V. Unhealthy',
                color: Colors.yellowAccent,
              ),
              GaugeRange(
                startValue: 301,
                endValue: 500,
                label: 'Hazardous',
                color: Colors.red,
              ),
            ],
            pointers: <GaugePointer>[
              //Todo:Replace the value with a variable of the acutal AQL.
              NeedlePointer(
                value: 200,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  children: [
                    //Todo:Replace the value with a variable of the acutal AQL.
                    Text(
                      '200',
                      style: textTheme.displayMedium?.copyWith(fontSize: 30.sp),
                    ),
                    Text(
                      'AQI',
                      style: textTheme.titleMedium,
                    )
                  ],
                ),
                verticalAlignment: GaugeAlignment.near,
              )
            ],
          ),
        ],
      ),
    );
  }
}
