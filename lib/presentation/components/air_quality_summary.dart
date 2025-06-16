import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:bloc_app/utilities/airQuality_helpers.dart';
import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../bloc/cubits.dart';
import 'components.dart';

class AirQualitySummary extends StatelessWidget {
  const AirQualitySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;

    return ConstrainedBox(
      key: const ValueKey(1),
      constraints: BoxConstraints(
        minHeight: 0.45.sh,
        minWidth: 0.4.sw,
        maxWidth: 0.95.sw,
        maxHeight: 0.5.sh,
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            sizedH4,
            Flexible(
              flex: 3,
              child: BlocBuilder<AirQualityBloc, AirQualityState>(
                builder: (context, state) {
                  double? getAQI;
                  if (state is AirQualityLoadFailure) {
                    return displayGauge(
                      context,
                      textTheme,
                      getAQI,
                      isLightThemed,
                    );
                  } else if (state is AirQualityLoadSuccess) {
                    final pollutantsConcentrations = state.data;
                    getAQI = AirQualityHelpers.getAirQualityIndex(
                      aQModels: pollutantsConcentrations,
                    );
                    return displayGauge(
                      context,
                      textTheme,
                      getAQI,
                      isLightThemed,
                    );
                  }
                  return displayGauge(
                    context,
                    textTheme,
                    getAQI,
                    isLightThemed,
                  );
                },
              ),
            ),
            Flexible(
              child: BlocBuilder<AirQualityBloc, AirQualityState>(
                builder: (context, state) {
                  final _isError = state is AirQualityLoadFailure;
                  final _isSuccess = state is AirQualityLoadSuccess;

                  const listViewLength = 3;

                  //Show a toast when an error occurs.
                  if (_isError) {
                    final _error = state;
                    Fluttertoast.showToast(
                      msg: _error.exception.toString(),
                      backgroundColor: Colors.redAccent,
                      textColor: Colors.white,
                      gravity: ToastGravity.SNACKBAR,
                      fontSize: 14.sp,
                    );
                  }
                  //Show data when the data loads
                  if (_isSuccess) {
                    final _pollutants = state.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return sizedW16;
                      },

                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      itemCount: listViewLength,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final filteredList =
                            _pollutants
                                .where(
                                  (pollutant) =>
                                      pollutant.pollutantSymbol == 'CO' ||
                                      pollutant.pollutantSymbol == 'O₃' ||
                                      pollutant.pollutantSymbol == 'PM25',
                                )
                                .toList();

                        final data = filteredList[index];

                        return _buildAirQualityPollutantsInfo(data);
                      },
                    );
                  }

                  //Display shimmer effect when the data is loading.
                  return _shimmerOnLoadingInProgress(isLightThemed);
                },
              ),
            ),
            //sizedH8,
          ],
        ),
      ),
    );
  }

  Widget _buildAirQualityPollutantsInfo(AirQualityPollutantModel data) {
    return AirQualitySummaryParameter(
      aqIconPath: AssetPath.mapPollutantToIcon(data.pollutantSymbol),
      aqParameterName: data.pollutantName.trim(),
      aqParameterValue: data.basePollutantConc,
      aqParameterUnit: data.getpollutantUnitStringFor(),
    );
  }

  Row _shimmerOnLoadingInProgress(bool isLightThemed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Skeletonizer(
          switchAnimationConfig: SwitchAnimationConfig(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
          ),

          effect: ShimmerEffect(
            baseColor:
                (isLightThemed)
                    ? LightColorConstants.secondaryColor_2
                    : DarkColorConstants.secondaryColor_2,

            highlightColor:
                (isLightThemed)
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,

            duration: Duration(milliseconds: 700),
          ),
          enabled: true,
          child: AirQualitySummaryParameter(
            aqIconPath: AssetPath.coIcon,
            aqParameterName: 'Carbon 1',
            aqParameterUnit: 'µmm/g',
            aqParameterValue: 5.0,
          ),
        ),
        Skeletonizer(
          switchAnimationConfig: SwitchAnimationConfig(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
          ),

          effect: ShimmerEffect(
            baseColor:
                (isLightThemed)
                    ? LightColorConstants.secondaryColor_2
                    : DarkColorConstants.secondaryColor_2,

            highlightColor:
                (isLightThemed)
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,

            duration: Duration(milliseconds: 700),
          ),
          enabled: true,
          child: AirQualitySummaryParameter(
            aqIconPath: AssetPath.pm25Icon,
            aqParameterName: 'PM 2.5',
            aqParameterValue: 100,
            aqParameterUnit: 'µmm/g',
          ),
        ),
        Skeletonizer(
          switchAnimationConfig: SwitchAnimationConfig(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
          ),

          effect: ShimmerEffect(
            baseColor:
                (isLightThemed)
                    ? LightColorConstants.secondaryColor_2
                    : DarkColorConstants.secondaryColor_2,

            highlightColor:
                (isLightThemed)
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,

            duration: Duration(milliseconds: 700),
          ),
          enabled: true,
          child: AirQualitySummaryParameter(
            aqIconPath: AssetPath.o3Icon,
            aqParameterName: 'Ozone',
            aqParameterValue: 2.5,
            aqParameterUnit: 'µmm/g',
          ),
        ),
      ],
    );
  }

  AspectRatio displayGauge(
    BuildContext context,
    TextTheme textTheme,
    double? aqiValue,
    bool isLightThemed,
  ) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 3 : 4 / 3,
      child: SfRadialGauge(
        animationDuration: 1000,
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 500,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 50,
                label: 'Good',
                color: Colors.greenAccent,
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
                color: Colors.redAccent,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                needleColor:
                    (isLightThemed)
                        ? LightColorConstants.primaryColor
                        : LightColorConstants.secondaryColor_2,
                animationType: AnimationType.elasticOut,
                value: aqiValue ?? 0.0,
                enableAnimation: true,
                animationDuration: 800,
                knobStyle: KnobStyle(
                  color:
                      (isLightThemed)
                          ? LightColorConstants.primaryColor
                          : DarkColorConstants.secondaryColor_2,
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  children: [
                    sizedH32,
                    Skeletonizer(
                      switchAnimationConfig: SwitchAnimationConfig(
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeOut,
                      ),

                      effect: ShimmerEffect(
                        baseColor:
                            (isLightThemed)
                                ? LightColorConstants.secondaryColor_2
                                : DarkColorConstants.secondaryColor_2,

                        highlightColor:
                            (isLightThemed)
                                ? LightColorConstants.primaryColor
                                : DarkColorConstants.primaryColor,

                        duration: Duration(milliseconds: 700),
                      ),
                      enabled: (aqiValue == null),
                      child: Text(
                        '${aqiValue}',
                        style: textTheme.displayMedium?.copyWith(
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                    Text('AQI', style: textTheme.titleMedium),
                  ],
                ),
                verticalAlignment: GaugeAlignment.near,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
