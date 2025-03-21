import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AirQualitySummary extends StatelessWidget {
  const AirQualitySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      key: const ValueKey(1),
      constraints: BoxConstraints(minHeight: 400, minWidth: 350),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8),
        color: Color.fromRGBO(225, 225, 225, 225),
        child: Column(
          children: <Widget>[
            sizedH8,
            AspectRatio(
              aspectRatio: 5 / 4,
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
                              style: textTheme.displayMedium,
                            ),
                            Text(
                              'AQI',
                              style: textTheme.titleSmall,
                            )
                          ],
                        ),
                        verticalAlignment: GaugeAlignment.near,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    Image.asset(
                      AssetPath.coIcon,
                      width: 30.0,
                      height: 30.0,
                      color: Colors.white,
                    ),
                    Text(
                      '100',
                      style: textTheme.titleSmall,
                    ),
                    Text('Monoxide'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    Image.asset(
                      AssetPath.pm25Icon,
                      width: 35.0,
                      height: 35.0,
                    ),
                    Text(
                      '100',
                      style: textTheme.titleSmall,
                    ),
                    Text('PM 2.5'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    Image.asset(
                      AssetPath.o3Icon,
                      width: 35.0,
                      height: 35.0,
                    ),

                    Text(
                      '70',
                      style: textTheme.titleSmall,
                    ),
                    Text('Ozone'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
