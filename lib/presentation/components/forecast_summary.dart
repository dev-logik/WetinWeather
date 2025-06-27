import 'package:bloc_app/bloc/weather_bloc.dart';
import 'package:bloc_app/models/weather_forecast_model.dart';
import 'package:bloc_app/utilities/utilities.dart';
import 'package:bloc_app/utilities/weather_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'components.dart';

class ForecastSummary extends StatefulWidget {
  const ForecastSummary({super.key});

  @override
  State<ForecastSummary> createState() => _ForecastSummaryState();
}

class _ForecastSummaryState extends State<ForecastSummary> {
  late final WeatherDataBloc weatherDataBloc;

  @override
  void initState() {
    weatherDataBloc = context.read<WeatherDataBloc>();
    weatherDataBloc.add(LoadInitialWeatherDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    weatherDataBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightThemed = Theme.of(context).brightness == Brightness.light;

    return ConstrainedBox(
      key: const ValueKey(0),
      constraints: BoxConstraints(
        minHeight: 0.45.sh,
        minWidth: 0.95.sw,
        maxWidth: 0.95.sw,
        maxHeight: 0.5.sh,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            sizedH4,
            Flexible(child: displayAnimation(context, isLightThemed), flex: 3),
            isTabletPortrait(context) ? Container() : sizedH24,
            Flexible(
              child: _loadWeatherData(isLightThemed),
            ), //isTabletPortrait(context) ? sizedH8 : sizedH4,
          ],
        ),
      ),
    );
  }

  BlocBuilder<WeatherDataBloc, WeatherDataStates> _loadWeatherData(
    bool isLightThemed,
  ) {
    return BlocBuilder<WeatherDataBloc, WeatherDataStates>(
      builder: (context, state) {
        final isSuccessful = state is WeatherDataLoadSuccess;
        final isError = state is WeatherDataLoadFailure;
        if (isSuccessful) {
          final data = state.data.value;
          final actualData =
              data
                  .where(
                    (weatherVariable) =>
                        weatherVariable.jsonName.contains('temperature_2m') ||
                        weatherVariable.jsonName.contains('wind_speed_10m') ||
                        weatherVariable.jsonName.contains(
                          'relative_humidity_2m',
                        ),
                  )
                  .toList();
          return _weatherVariableData(actualData);
        }

        if (isError) {
          final err = state.errObj;
          Fluttertoast.showToast(
            msg: err.toString(),
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 14.sp,
          );
        }

        return _shimmerOnLoading(isLightThemed);
      },
      buildWhen: (previous, current) {
        if (previous.runtimeType != current.runtimeType) {
          return true;
        }

        if (current is WeatherDataLoadSuccess &&
            previous is WeatherDataLoadSuccess) {
          return (current.data != previous.data);
        }

        if (previous != current) {
          return true;
        }

        return false;
      },
    );
  }

  ListView _weatherVariableData(List<WeatherForecastVariableModel> actualData) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return WeatherSummaryParameter(
          weatherParameterIcon:
              WeatherHelpers.mapWeatherVariableToIcon(
                actualData[index].jsonName,
              ) ??
              FontAwesomeIcons.stop,
          weatherParameterName: actualData[index].displayName,
          weatherParameterValue: actualData[index].value.toStringAsFixed(1),
          weatherParameterUnit: actualData[index].unit,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: .15.sw);
      },
    );
  }

  Skeletonizer _shimmerOnLoading(bool isLightThemed) {
    return Skeletonizer(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          WeatherSummaryParameter(
            weatherParameterIcon: FontAwesomeIcons.temperatureHalf,
            weatherParameterName: 'Temperature',
            weatherParameterValue: 33.toString(),
            weatherParameterUnit: '°C',
          ),
          WeatherSummaryParameter(
            weatherParameterIcon: FontAwesomeIcons.wind,
            weatherParameterName: 'Wind',
            weatherParameterUnit: 'm/s',
            weatherParameterValue: '4',
          ),
          WeatherSummaryParameter(
            weatherParameterIcon: FontAwesomeIcons.droplet,
            weatherParameterName: 'Humidity',
            weatherParameterUnit: '%',
            weatherParameterValue: '8',
          ),
        ],
      ),
    );
  }

  AspectRatio displayAnimation(BuildContext context, bool isLightThemed) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 3 : 4 / 3,
      child: BlocBuilder<WeatherDataBloc, WeatherDataStates>(
        buildWhen: (previous, current) {
          if (previous.runtimeType != current.runtimeType) {
            return true;
          }

          if (current is WeatherDataLoadSuccess &&
              previous is WeatherDataLoadSuccess) {
            return (current.data != previous.data);
          }

          if (previous != current) {
            return true;
          }

          return false;
        },
        builder: (context, state) {
          final isSuccessful = state is WeatherDataLoadSuccess;
          final isError = state is WeatherDataLoadFailure;

          if (isSuccessful) {
            final data = state.data.value;
            debugPrint(data.length.toString());
            var actualData =
                data
                    .where(
                      (weatherVariable) =>
                          weatherVariable.displayName.contains('Weather') ||
                          weatherVariable.displayName.contains('Is it day?'),
                    )
                    .toList();

            return Lottie.asset(
              WeatherHelpers.WeatherCodeToAnimation(
                isDay: actualData[0].value.toInt(),
                weatherCode: actualData[1].value.toInt(),
              ),
              height: 300.h,
              width: 300.w,
              fit: BoxFit.contain,
            );
          }

          if (isError) {
            final err = state.errObj;
            Fluttertoast.showToast(
              msg: err.toString(),
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              gravity: ToastGravity.SNACKBAR,
              fontSize: 14.sp,
            );
          }

          return LoadingAnimationWidget.inkDrop(
            color:
                (isLightThemed)
                    ? LightColorConstants.primaryColor
                    : DarkColorConstants.primaryColor,
            size: 100.sp,
          );
        },
      ),
    );
  }
}
