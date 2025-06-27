import 'package:bloc_app/bloc/cubits_blocs.dart';
import 'package:bloc_app/models/weather_forecast_model.dart';
import 'package:bloc_app/utilities/weather_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../utilities/error_helpers.dart';
import '../../utilities/utilities.dart';
import '../components/components.dart';
import 'FutureTesting.dart';

Function getIconJson = WeatherHelpers.mapWeatherVariableToIcon;
Function getDirection = WeatherHelpers.getWindDirectionAbbr;

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  late final LocationCubit locationStateProvider;
  late final WeatherDataBloc weatherDataCubit;
  @override
  void initState() {
    super.initState();
    context.read<DateTimeCubit>().startTime();
    locationStateProvider = context.read<LocationCubit>();
    locationStateProvider.startLocationService();
    weatherDataCubit = context.read<WeatherDataBloc>();
    weatherDataCubit.add(LoadInitialWeatherDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
    context.read<DateTimeCubit>().dispose();
    weatherDataCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(parent: CarouselScrollPhysics()),
            children: [
              sizedH8,
              headerSection(textTheme, isLightThemed, context),
              locationNameSection(textTheme, isLightThemed),
              sizedH4,
              Demarcation(length: 0.4.sw),
              sizedH8,
              _weatherDetailText(textTheme, context, isLightThemed),
              sizedH8,
              forecastSection(textTheme, context, isLightThemed),
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: weblinkSection(textTheme, isLightThemed, context),
              ),
              isPhoneLandscape(context) ? sizedH4 : sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(thickness: 1.2.sp, color: Colors.white),
              ),
              sizedH16,
              weatherStatsSection(isLightThemed),
              isPhoneLandscape(context) ? sizedH4 : sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(thickness: 1.2.sp, color: Colors.white),
              ),
              sizedH16,
              _buttonSection(context, isLightThemed),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<LocationCubit, LocationState> locationNameSection(
    TextTheme textTheme,
    bool isLightThemed,
  ) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state.locationName != null) {
          return _loadLocation(state, textTheme, context);
        }

        return _shimmerOnLoading(isLightThemed, textTheme, context);
      },
    );
  }

  Text _loadLocation(
    LocationState state,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Text(
      '${state.locationName}',
      style: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w100,
        color: Colors.white,
        textBaseline: TextBaseline.alphabetic,
        fontSize:
            isTabletPortrait(context)
                ? 60.sp
                : isTabletLandscape(context)
                ? 50.sp
                : isPhoneLandscape(context)
                ? 45.sp
                : 30.sp,
      ),
    );
  }

  Skeletonizer _shimmerOnLoading(
    bool isLightThemed,
    TextTheme textTheme,
    BuildContext context,
  ) {
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
                ? LightColorConstants.secondaryColor_2
                : DarkColorConstants.secondaryColor_2,
        duration: Duration(milliseconds: 700),
      ),
      enabled: true,
      child: Text(
        'Loading...',
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w100,
          color: Colors.white,
          textBaseline: TextBaseline.alphabetic,
          fontSize:
              isTabletPortrait(context)
                  ? 60.sp
                  : isTabletLandscape(context)
                  ? 50.sp
                  : isPhoneLandscape(context)
                  ? 45.sp
                  : 30.sp,
        ),
      ),
    );
  }

  Align _buttonSection(BuildContext context, bool isLightThemed) {
    return Align(
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {
          context.pushNamed('home');
        },
        child: Icon(
          FontAwesomeIcons.arrowLeft,
          size: isTabletPortrait(context) ? 30.sp : 14.sp,
          color: (isLightThemed) ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _weatherDetailText(
    TextTheme textTheme,
    BuildContext context,
    bool isLightThemed,
  ) {
    return BlocBuilder<WeatherDataBloc, WeatherDataStates>(
      builder: (context, state) {
        final isSuccess = state is WeatherDataLoadSuccess;
        final isError = state is WeatherDataLoadFailure;

        if (isSuccess) {
          final data = state.data.value;
          final aD =
              data.where((weatherVariable) {
                return weatherVariable.jsonName == 'is_day' ||
                    weatherVariable.jsonName == 'cloud_cover' ||
                    weatherVariable.jsonName == 'weather_code';
              }).toList();
          return _loadForecast(aD, textTheme, context);
        }

        if (isError) {
          final _error = state.errObj;
          final _msg = ErrorHelpers.getFriendlyError(_error);

          Fluttertoast.showToast(
            msg: _msg,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 14.sp,
          );
        }

        return _onLoadingForecast(isLightThemed, textTheme, context);
      },
    );
  }

  Skeletonizer _onLoadingForecast(
    bool isLightThemed,
    TextTheme textTheme,
    BuildContext context,
  ) {
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
      child: RichText(
        text: TextSpan(
          text: 'Clear and Sunny',
          style: textTheme.bodyLarge?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 40.sp
                    : isTabletLandscape(context)
                    ? 35.sp
                    : isPhoneLandscape(context)
                    ? 30.sp
                    : 20.sp,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: '\nDay',
              style: textTheme.bodyMedium?.copyWith(
                fontSize:
                    isTabletPortrait(context)
                        ? 40.sp
                        : isTabletLandscape(context)
                        ? 35.sp
                        : isPhoneLandscape(context)
                        ? 30.sp
                        : 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText _loadForecast(
    List<WeatherForecastVariableModel> aD,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return RichText(
      text: TextSpan(
        text:
            '${WeatherHelpers.getCloudCoverRemark(aD[2].value.toInt())} and ${WeatherHelpers.getWeatherRemark(aD[1].value.toInt())} ',
        style: textTheme.bodyLarge?.copyWith(
          fontSize:
              isTabletPortrait(context)
                  ? 40.sp
                  : isTabletLandscape(context)
                  ? 35.sp
                  : isPhoneLandscape(context)
                  ? 30.sp
                  : 20.sp,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: '\n${WeatherHelpers.getIsDayRemarks(aD[0].value.toInt())} ',
            style: textTheme.bodyMedium?.copyWith(
              fontSize:
                  isTabletPortrait(context)
                      ? 40.sp
                      : isTabletLandscape(context)
                      ? 35.sp
                      : isPhoneLandscape(context)
                      ? 30.sp
                      : 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  ConstrainedBox weatherStatsSection(bool isLightThemed) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        //maxHeight: 0.32.sh,
        minWidth: double.infinity,
      ),
      child: BlocBuilder<WeatherDataBloc, WeatherDataStates>(
        builder: (context, state) {
          final isSuccess = state is WeatherDataLoadSuccess;
          final isError = state is WeatherDataLoadFailure;
          if (isSuccess) {
            final data = state.data.value;
            final aD =
                data.where((weatherElement) {
                  return weatherElement.jsonName.contains(
                        'relative_humidity_2m',
                      ) ||
                      weatherElement.jsonName.contains('precipitation') ||
                      weatherElement.jsonName.contains('wind_speed_10m') ||
                      weatherElement.jsonName.contains('wind_direction_10m') ||
                      weatherElement.jsonName.contains('rain') ||
                      weatherElement.jsonName.contains('showers') ||
                      weatherElement.jsonName.contains('snowfall') ||
                      weatherElement.jsonName.contains('cloud_cover');
                }).toList();
            return _loadWeatherVariables(aD);
          }
          if (isError) {
            final _error = state.errObj;
            final _msg = ErrorHelpers.getFriendlyError(_error);

            Fluttertoast.showToast(
              msg: _msg,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              gravity: ToastGravity.SNACKBAR,
              fontSize: 14.sp,
            );
          }
          return _shimmerOnLoadingWeatherVariables(isLightThemed);
        },
      ),
    );
  }

  Skeletonizer _shimmerOnLoadingWeatherVariables(bool isLightThemed) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherCompleteParameter(
                iconData: FontAwesomeIcons.wind,
                weatherParameterName: 'Wind',
                weatherParameterUnit: 'm/s',
                weatherParameterValue: 3.1.toString(),
              ),
              WeatherCompleteParameter(
                iconData: FontAwesomeIcons.droplet,
                weatherParameterName: 'Humidity',
                weatherParameterUnit: '%',
                weatherParameterValue: 5.toString(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherCompleteParameter(
                iconData: FontAwesomeIcons.compass,
                weatherParameterName: 'Direction',
                weatherParameterUnit: '',
                weatherParameterValue: 'NW',
              ),
              WeatherCompleteParameter(
                iconData: FontAwesomeIcons.temperatureLow,
                weatherParameterName: 'Temperature',
                weatherParameterUnit: '°C',
                weatherParameterValue: '37',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherCompleteParameter(
                iconData: FontAwesomeIcons.icicles,
                weatherParameterName: 'Preci. Type',
                weatherParameterUnit: '',
                weatherParameterValue: 'Snow',
              ),
              WeatherCompleteParameter(
                iconData: FontAwesomeIcons.cloudRain,
                weatherParameterName: 'Preci. Amount',
                weatherParameterUnit: 'mm/hr',
                weatherParameterValue: '34',
              ),
            ],
          ),
        ],
      ),
    );
  }

  GridView _loadWeatherVariables(List<WeatherForecastVariableModel> aD) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      itemCount: 8,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18.h,
        childAspectRatio: 5 / 2.5,
      ),
      itemBuilder: (context, index) {
        final jsonName = aD[index].jsonName;
        final variableName = aD[index].displayName;
        final variableUnit = aD[index].unit;
        final variableValue = aD[index].value;

        return WeatherCompleteParameter(
          iconData: getIconJson(jsonName) ?? FontAwesomeIcons.question,
          weatherParameterName: variableName,
          weatherParameterValue:
              (jsonName.contains('wind_direction')
                  ? getDirection(variableValue.toInt())
                  : variableValue.toStringAsFixed(1)),
          weatherParameterUnit:
              (jsonName.contains('wind_direction') ? '' : variableUnit),
        );
      },
    );
  }
}

Row weblinkSection(
  TextTheme textTheme,
  bool isLightThemed,
  BuildContext context,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Details: ',
        style: textTheme.headlineSmall?.copyWith(
          fontSize:
              isTabletPortrait(context)
                  ? 35.sp
                  : isTabletLandscape(context)
                  ? 40.sp
                  : isPhoneLandscape(context)
                  ? 24.sp
                  : null,
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 8.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'www.7timer.com',
                style: textTheme.labelSmall?.copyWith(
                  color:
                      (Theme.of(context).brightness == Brightness.light)
                          ? LightColorConstants.secondaryColor_1
                          : DarkColorConstants.secondaryColor_1,
                  fontSize:
                      isTabletPortrait(context)
                          ? 24.sp
                          : isTabletLandscape(context)
                          ? 20.sp
                          : isPhoneLandscape(context)
                          ? 20.sp
                          : null,
                ),
              ),
              sizedW4,
              Icon(
                Icons.link,
                color:
                    (isLightThemed)
                        ? LightColorConstants.primaryColor
                        : DarkColorConstants.tertiaryColor,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget forecastSection(
  TextTheme textTheme,
  BuildContext context,
  bool isLightThemed,
) {
  return BlocBuilder<WeatherDataBloc, WeatherDataStates>(
    builder: (context, state) {
      final isSuccess = state is WeatherDataLoadSuccess;
      final isError = state is WeatherDataLoadFailure;

      if (isSuccess) {
        final data = state.data.value;
        final aD =
            data.where((weatherElement) {
              return weatherElement.jsonName.contains('weather_code') ||
                  weatherElement.jsonName.contains('temperature_2m') ||
                  weatherElement.jsonName.contains('apparent_temperature');
            }).toList();

        return _loadForecastData(aD, context, textTheme);
      }
      if (isError) {
        final _error = state.errObj;
        final _msg = ErrorHelpers.getFriendlyError(_error);

        Fluttertoast.showToast(
          msg: _msg,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 14.sp,
        );
      }
      return _onLoading(context, isLightThemed, textTheme);
    },
  );
}

Row _onLoading(BuildContext context, bool isLightThemed, TextTheme textTheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      LoadingAnimationWidget.fallingDot(
        size: isTabletLandscape(context) ? 95.sp : 80.sp,
        color:
            (isLightThemed)
                ? LightColorConstants.secondaryColor_1
                : DarkColorConstants.secondaryColor_1,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
            child: RichText(
              text: TextSpan(
                text: '33',
                style: textTheme.displayLarge?.copyWith(
                  fontSize:
                      isTabletPortrait(context)
                          ? 80.sp
                          : isTabletLandscape(context)
                          ? 70.sp
                          : 65.sp,
                ),
                children: [
                  TextSpan(
                    text: '°',
                    style: textTheme.displayLarge?.copyWith(fontSize: 65.sp),
                  ),
                  TextSpan(
                    text: '\n                 /Real Feel',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize:
                          isTabletPortrait(context)
                              ? 25.sp
                              : isTabletLandscape(context)
                              ? 20.sp
                              : isPhoneLandscape(context)
                              ? 18.sp
                              : 15.sp,
                    ),
                  ),
                  TextSpan(
                    text: '\n                         30°',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize:
                          isTabletPortrait(context)
                              ? 30.sp
                              : isTabletLandscape(context)
                              ? 24.sp
                              : isPhoneLandscape(context)
                              ? 20.sp
                              : 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Row _loadForecastData(
  List<WeatherForecastVariableModel> aD,
  BuildContext context,
  TextTheme textTheme,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Icon(
        WeatherHelpers.getWeatherIcon(aD[2].value.toInt()),
        size: isTabletLandscape(context) ? 95.sp : 80.sp,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              text: '${aD[0].value.toDouble().toStringAsFixed(1)}',
              style: textTheme.displayLarge?.copyWith(
                fontSize:
                    isTabletPortrait(context)
                        ? 80.sp
                        : isTabletLandscape(context)
                        ? 70.sp
                        : 65.sp,
              ),
              children: [
                TextSpan(
                  text: '°',
                  style: textTheme.displayLarge?.copyWith(fontSize: 65.sp),
                ),
                TextSpan(
                  text: '\n                 /Real Feel',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize:
                        isTabletPortrait(context)
                            ? 25.sp
                            : isTabletLandscape(context)
                            ? 20.sp
                            : isPhoneLandscape(context)
                            ? 18.sp
                            : 15.sp,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${aD[1].value.toDouble().toStringAsFixed(1)}${aD[1].unit}',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize:
                        isTabletPortrait(context)
                            ? 30.sp
                            : isTabletLandscape(context)
                            ? 24.sp
                            : isPhoneLandscape(context)
                            ? 20.sp
                            : 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Row headerSection(
  TextTheme textTheme,
  bool isLightThemed,
  BuildContext context,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: BlocBuilder<DateTimeCubit, DateTimeState>(
          builder: (context, state) {
            return Text(
              '${formatTime(state.accessDateTime)}',
              style: textTheme.titleMedium?.copyWith(
                fontSize:
                    isTabletPortrait(context)
                        ? 30.sp
                        : isTabletLandscape(context)
                        ? 35.sp
                        : isPhoneLandscape(context)
                        ? 25.sp
                        : 18.sp,
              ),
            );
          },
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FutureTesting();
              },
            ),
          );
        },
        icon: Icon(
          isLightThemed ? FontAwesomeIcons.solidSun : FontAwesomeIcons.moon,
          size:
              isTabletPortrait(context)
                  ? 30.sp
                  : isTabletLandscape(context)
                  ? 35.sp
                  : isPhoneLandscape(context)
                  ? 25.sp
                  : 24.sp,
        ),
      ),
    ],
  );
}
