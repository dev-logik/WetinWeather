import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../bloc/cubits.dart';
import '../../models/models.dart';
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
              child: _showGaugeStateHandler(textTheme, isLightThemed),
            ),
            Flexible(
              flex: 1,
              child: _showPollutantSummaryStateHandler(isLightThemed),
            ),
            //sizedH8,
          ],
        ),
      ),
    );
  }

  Widget _showPollutantSummaryStateHandler(bool isLightThemed) {
    return BlocConsumer<AirQualityBloc, AirQualityState>(
      builder: (context, state) {
        final _isError = state is AirQualityLoadFailure;
        final _isSuccess = state is AirQualityLoadSuccess;

        const listViewLength = 3;
        //Show pollutant data when the response is successful.
        if (_isSuccess) {
          final _pollutants = state.data;
          return _loadnShowPollutantsData(listViewLength, _pollutants);
        }

        //Display shimmer effect when the data is loading.
        return _shimmerOnLoadingInProgress(isLightThemed);
      },
      listener: (BuildContext context, AirQualityState state) {
        if (state is AirQualityLoadFailure) {
          final _error = state.exception;
          Fluttertoast.showToast(
            msg: _error.toString(),
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 14.sp,
          );
        }
      },
      buildWhen: (previous, current) {
        if (previous.runtimeType != current.runtimeType) {
          return true;
        }

        if (current is AirQualityLoadSuccess &&
            previous is AirQualityLoadSuccess) {
          return (current.data != previous.data);
        }

        if (previous != current) {
          return true;
        }

        return false;
      },
    );
  }

  Widget _loadnShowPollutantsData(
    int listViewLength,
    List<AirQualityPollutantModel> _pollutants,
  ) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(width: .15.sw);
      },

      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),

      primary: false,
      itemCount: listViewLength,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final _filteredPollutants =
            _pollutants
                .where(
                  (pollutant) =>
                      pollutant.pollutantSymbol == 'CO' ||
                      pollutant.pollutantSymbol == 'O₃' ||
                      pollutant.pollutantSymbol == 'PM25',
                )
                .toList();

        final data = _filteredPollutants[index];

        return _buildAirQualityPollutantsInfo(data, index);
      },
    );
  }

  Widget _showGaugeStateHandler(TextTheme textTheme, bool isLightThemed) {
    return BlocBuilder<AirQualityBloc, AirQualityState>(
      builder: (context, state) {
        double? _getAQI;
        if (state is AirQualityLoadFailure) {
        } else if (state is AirQualityLoadSuccess) {
          final pollutantsConcentrations = state.data;
          _getAQI = AirQualityHelpers.getAirQualityIndex(
            aQModels: pollutantsConcentrations,
          );
          return displayGauge(context, textTheme, _getAQI, isLightThemed);
        }
        return displayGauge(context, textTheme, _getAQI, isLightThemed);
      },
      buildWhen: (previous, current) {
        if (previous.runtimeType != current.runtimeType) {
          return true;
        }

        if (current is AirQualityLoadSuccess &&
            previous is AirQualityLoadSuccess) {
          return (current.data != previous.data);
        }

        if (previous != current) {
          return true;
        }

        return false;
      },
    );
  }

  Widget _buildAirQualityPollutantsInfo(
    AirQualityPollutantModel data,
    int index,
  ) {
    return AirQualityPollutantSummaryCard(
      key: ValueKey('Pollutant: $index'),
      aqIconPath: AssetPath.mapPollutantToIcon(data.pollutantSymbol),
      aqParameterName: data.pollutantName.trim(),
      aqParameterValue: data.basePollutantConc,
      aqParameterUnit: data.getpollutantUnitStringFor(),
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
        axes: [
          RadialAxis(
            minimum: 0,
            maximum: 500,
            numberFormat: NumberFormat.compact(locale: 'en'),
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.greenAccent,
              ),
              GaugeRange(
                startValue: 51,
                endValue: 100,
                color: Colors.yellowAccent,
              ),
              GaugeRange(
                startValue: 101,
                endValue: 150,
                color: Colors.orangeAccent,
              ),
              GaugeRange(
                startValue: 151,
                endValue: 200,
                color: Colors.redAccent,
              ),
              GaugeRange(
                startValue: 201,
                endValue: 300,
                color: Colors.purpleAccent,
              ),
              GaugeRange(
                startValue: 301,
                endValue: 500,
                color: Colors.red[900],
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
                          ? LightColorConstants.secondaryColor_2
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
                                ? LightColorConstants.primaryColor
                                : DarkColorConstants.primaryColor,

                        highlightColor:
                            (isLightThemed)
                                ? LightColorConstants.secondaryColor_1
                                : DarkColorConstants.secondaryColor_1,

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
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,

            highlightColor:
                (isLightThemed)
                    ? LightColorConstants.secondaryColor_1
                    : DarkColorConstants.secondaryColor_1,

            duration: Duration(milliseconds: 700),
          ),
          enabled: true,
          child: AirQualityPollutantSummaryCard(
            aqIconPath: AssetPath.coIcon,
            aqParameterName: 'Loading...',
            aqParameterUnit: 'µmm/g',
            aqParameterValue: 100,
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
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,

            highlightColor:
                (isLightThemed)
                    ? LightColorConstants.secondaryColor_1
                    : DarkColorConstants.secondaryColor_1,

            duration: Duration(milliseconds: 700),
          ),
          enabled: true,
          child: AirQualityPollutantSummaryCard(
            aqIconPath: AssetPath.pm25Icon,
            aqParameterName: 'Loading...',
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
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,

            highlightColor:
                (isLightThemed)
                    ? LightColorConstants.secondaryColor_1
                    : DarkColorConstants.secondaryColor_1,

            duration: Duration(milliseconds: 700),
          ),
          enabled: true,
          child: AirQualityPollutantSummaryCard(
            aqIconPath: AssetPath.o3Icon,
            aqParameterName: 'Loading...',
            aqParameterValue: 100,
            aqParameterUnit: 'µmm/g',
          ),
        ),
      ],
    );
  }
}
