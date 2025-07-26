import 'package:bloc_app/presentation/screens/hourly_weather_forecast_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../bloc/cubits_blocs.dart';
import '../../utilities/utilities.dart';
import '../components/components.dart';

class HourlySection extends StatelessWidget {
  final int numberOfForecastToShow;

  HourlySection({super.key, this.numberOfForecastToShow = 12});

  @override
  Widget build(BuildContext context) {
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight:
            isTabletPortrait(context)
                ? 0.15.sh
                : isTabletLandscape(context)
                ? 0.25.sh
                : isPhoneLandscape(context)
                ? 0.30.sh
                : 0.13.sh,
        maxWidth: double.infinity,
      ),
      child: BlocBuilder<HourlyWeatherForecastDataBloc, HourlyForecastStates>(
        builder: (context, state) {
          final isSuccess = state is HourlyWeatherForecastLoadSuccess;
          final isError = state is HourlyWeatherForecastLoadFailure;

          if (isSuccess) {
            final hourlyForecasts = state.data.value;
            return ListView.builder(
              itemBuilder: (context, index) {
                final data = hourlyForecasts[index];
                final timeStamp = data.getDateTime;
                final tempValue = data.temperature;
                final tempUnit = '°C';
                final weatherCode = data.weatherCode;
                return GestureDetector(
                  child: HourlyWeatherForecastCard(
                    timeStamp: timeStamp,
                    tempValue: tempValue,
                    tempUnit: tempUnit,
                    weatherCode: weatherCode,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HourlyWeatherForecastDetails(
                              hourlyForecast: data,
                            ),
                      ),
                    );
                  },
                );
              },

              itemCount: numberOfForecastToShow,
              primary: false,
              scrollDirection: Axis.horizontal,
            );
          }
          if (isError) {
            final err = ErrorHelpers.getFriendlyError(state.errObj);
            Fluttertoast.showToast(
              msg: err,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              gravity: ToastGravity.SNACKBAR,
              fontSize: 14.sp,
            );
          }

          return _onLoadingShimmer(isLightThemed);
        },
        buildWhen: (previous, current) {
          if (previous.runtimeType != current.runtimeType) {
            return true;
          }

          if (current is HourlyWeatherForecastLoadSuccess &&
              previous is HourlyWeatherForecastLoadSuccess) {
            return (current.data.value != previous.data.value);
          }

          if (previous != current) {
            return true;
          }

          return false;
        },
      ),
    );
  }

  Skeletonizer _onLoadingShimmer(bool isLightThemed) {
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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HourlyWeatherForecastCard(
            tempUnit: '°C',
            tempValue: 15,
            weatherCode: 1,
            timeStamp: DateTime(2023, 1, 1),
          ),
          HourlyWeatherForecastCard(
            tempUnit: '°C',
            tempValue: 51,
            weatherCode: 30,
            timeStamp: DateTime(2023, 1, 1),
          ),
          HourlyWeatherForecastCard(
            tempUnit: '°C',
            tempValue: 61,
            weatherCode: 26,
            timeStamp: DateTime(2023, 1, 1),
          ),
          HourlyWeatherForecastCard(
            tempUnit: '°C',
            tempValue: 71,
            weatherCode: 13,
            timeStamp: DateTime(2023, 1, 1),
          ),
          HourlyWeatherForecastCard(
            tempUnit: '°C',
            tempValue: 85,
            weatherCode: 85,
            timeStamp: DateTime(2023, 1, 1),
          ),
          HourlyWeatherForecastCard(
            tempUnit: '°C',
            tempValue: 15,
            weatherCode: 99,
            timeStamp: DateTime(2023, 1, 1),
          ),
        ],
      ),
    );
  }
}
