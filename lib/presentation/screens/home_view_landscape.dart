import 'package:bloc_app/bloc/cubits.dart';
import 'package:bloc_app/presentation/screen%20sections/hourly_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utilities/utilities.dart';
import '../components/components.dart';

class HomeScreenMobileLandscape extends StatefulWidget {
  const HomeScreenMobileLandscape({super.key});

  @override
  State<HomeScreenMobileLandscape> createState() =>
      _HomeScreenMobileLandscapeState();
}

class _HomeScreenMobileLandscapeState extends State<HomeScreenMobileLandscape> {
  late final locationStateProvider, dateTimeCubitProvider;
  @override
  void initState() {
    dateTimeCubitProvider = context.read<DateTimeCubit>();
    locationStateProvider = context.read<LocationCubit>();

    dateTimeCubitProvider.startTime();

    if (locationStateProvider.state.locationName == '') {
      locationStateProvider.startLocationService();
    }

    super.initState();
  }

  @override
  void dispose() {
    dateTimeCubitProvider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return LiquidPullToRefresh(
      backgroundColor:
          (isLightThemed)
              ? LightColorConstants.primaryColor
              : DarkColorConstants.primaryColor,
      color:
          (isLightThemed)
              ? DarkColorConstants.secondaryColor_2
              : LightColorConstants.secondaryColor_2,
      onRefresh: () async {
        await context.read<LocationCubit>().startLocationService();
      },
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                isTabletLandscape(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isTabletLandscape(context) ? sizedH24 : sizedH16,
              headerSection(textTheme, isLightThemed),
              isTabletLandscape(context) ? sizedH24 : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 0.67.sw,
                      maxHeight: 0.55.sh,
                    ),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Flexible(child: _forecastSection(textTheme, context)),
                          _separator(),
                          Flexible(
                            child: _airQualitySection(textTheme, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _pageBreakHeaderSection(textTheme, context),
                        HourlySection(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerSection(TextTheme textTheme, bool isLightThemed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.locationName.isNotEmpty) {
              return Text(
                '${state.locationName}',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletLandscape(context) ? 70.sp : 35.sp,
                ),
              );
            } else {
              return CircularProgressIndicator(
                backgroundColor: Colors.white,
                color:
                    (isLightThemed)
                        ? LightColorConstants.secondaryColor_1
                        : DarkColorConstants.secondaryColor_1,
              );
            }
          },
        ),
        BlocBuilder<DateTimeCubit, DateTimeState>(
          builder: (context, state) {
            return Text(
              '${formatDate(state.accessDateTime)}',
              style: textTheme.headlineSmall?.copyWith(
                fontSize: isTabletLandscape(context) ? 28.sp : 16.sp,
              ),
            );
          },
        ),
      ],
    );
  }

  Padding _pageBreakHeaderSection(TextTheme textTheme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Today',
            style: textTheme.headlineSmall?.copyWith(
              fontSize: isTabletLandscape(context) ? 35.sp : 24.sp,
            ),
          ),
          InkWell(
            child: Text(
              'View full report',
              style: textTheme.labelSmall?.copyWith(
                color:
                    (Theme.of(context).brightness == Brightness.light)
                        ? LightColorConstants.secondaryColor_1
                        : DarkColorConstants.secondaryColor_1,
                fontSize: isTabletLandscape(context) ? 18.sp : null,
              ),
            ),
            //Todo: Implement the onTap function.
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container _separator() {
    return Container(color: Colors.white, width: 1.w, height: .5.sh);
  }

  Widget _airQualitySection(TextTheme textTheme, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('air quality details');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  isTabletLandscape(context) ? 6.dm : 2.dm,
                ),
                child: CircularPercentIndicator(
                  onPercentValue: (value) {},
                  progressColor: Colors.greenAccent,
                  curve: Curves.easeInCubic,
                  percent: 0.25,
                  radius: isTabletLandscape(context) ? 125.r : 50.r,
                  arcType: ArcType.FULL,
                  arcBackgroundColor: Colors.grey,
                  animateFromLastPercent: true,
                  animateToInitialPercent: true,
                  center: Text(
                    '25%',
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: isPhoneLandscape(context) ? 14.sp : 24.sp,
                    ),
                  ),
                  footer: Text(
                    'AQI',
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: isPhoneLandscape(context) ? 12.sp : 24.sp,
                    ),
                  ),
                  lineWidth: isTabletLandscape(context) ? 8.w : 4.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AirQualitySummaryParameter(
                  aqIconPath: AssetPath.coIcon,
                  aqParameterName: 'Carbon 1',
                  aqParameterUnit: 'µmm/g',
                  aqParameterValue: 5.0.toString(),
                ),
                isTabletLandscape(context) ? sizedW32 : sizedW24,
                AirQualitySummaryParameter(
                  aqIconPath: AssetPath.pm25Icon,
                  aqParameterName: 'PM 2.5',
                  aqParameterValue: '100',
                  aqParameterUnit: 'µmm/g',
                ),
                isTabletLandscape(context) ? sizedW32 : sizedW24,
                AirQualitySummaryParameter(
                  aqIconPath: AssetPath.o3Icon,
                  aqParameterName: 'Ozone',
                  aqParameterValue: '2.5',
                  aqParameterUnit: 'µmm/g',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _forecastSection(TextTheme textTheme, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('forcast details');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Lottie.asset(
              AssetPath.animatedSunnyRain,
              width:
                  isPhoneLandscape(context)
                      ? 120.w
                      : isTabletLandscape(context)
                      ? 300.w
                      : 100.w,
              height:
                  isPhoneLandscape(context)
                      ? 120.h
                      : isTabletLandscape(context)
                      ? 300.h
                      : 100.h,
              fit: BoxFit.cover,
            ),
          ),
          //sizedH4,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 4.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                WeatherSummaryParameter(
                  weatherParameterIcon: FontAwesomeIcons.temperatureHalf,
                  weatherParameterName: 'Temperature',
                  weatherParameterValue: 33.toString(),
                  weatherParameterUnit: '°C',
                ),
                isTabletLandscape(context) ? sizedW64 : sizedW24,
                WeatherSummaryParameter(
                  weatherParameterIcon: FontAwesomeIcons.wind,
                  weatherParameterName: 'Wind',
                  weatherParameterUnit: 'm/s',
                  weatherParameterValue: '4',
                ),
                isTabletLandscape(context) ? sizedW64 : sizedW24,
                WeatherSummaryParameter(
                  weatherParameterIcon: FontAwesomeIcons.droplet,
                  weatherParameterName: 'Humidity',
                  weatherParameterUnit: '%',
                  weatherParameterValue: '8',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
