import 'package:bloc_app/bloc/cubits.dart';
import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:bloc_app/presentation/screen%20sections/hourly_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../utilities/utilities.dart';
import '../components/components.dart';

class HomeScreenMobileLandscape extends StatefulWidget {
  const HomeScreenMobileLandscape({super.key});

  @override
  State<HomeScreenMobileLandscape> createState() =>
      _HomeScreenMobileLandscapeState();
}

class _HomeScreenMobileLandscapeState extends State<HomeScreenMobileLandscape> {
  late final LocationCubit _locationStateProvider;
  late final DateTimeCubit _dateTimeCubitProvider;
  late final AirQualityBloc _airQualityBloc;
  @override
  void initState() {
    _dateTimeCubitProvider = context.read<DateTimeCubit>();
    _locationStateProvider = context.read<LocationCubit>();
    _airQualityBloc = context.read<AirQualityBloc>();

    _dateTimeCubitProvider.startTime();
    _locationStateProvider.startLocationService();
    _airQualityBloc.add(LoadInitialDataEvent());

    super.initState();
  }

  @override
  void dispose() {
    _dateTimeCubitProvider.dispose();
    _airQualityBloc.close();
    super.dispose();
  }

  bool _isRefreshing = false;
  Future<void> _handlePullToRefresh() async {
    if (_isRefreshing) return;
    await context.read<LocationCubit>().startLocationService();
    _airQualityBloc.add(LoadInitialDataEvent());
    _isRefreshing = true;
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
      onRefresh: _handlePullToRefresh,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
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
              _dataSection(textTheme, context, isLightThemed),
            ],
          ),
        ],
      ),
    );
  }

  Row _dataSection(
    TextTheme textTheme,
    BuildContext context,
    bool isLightThemed,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.67.sw, maxHeight: 0.55.sh),
          child: _weatherNairQuality(textTheme, context, isLightThemed),
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
    );
  }

  Card _weatherNairQuality(
    TextTheme textTheme,
    BuildContext context,
    bool isLightThemed,
  ) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(child: _forecastSection(textTheme, context)),
          _separator(),
          Flexible(
            child: _airQualitySection(textTheme, context, isLightThemed),
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
            if (state.locationName != null) {
              return Text(
                '${state.locationName}',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletLandscape(context) ? 70.sp : 35.sp,
                ),
              );
            }

            return Skeletonizer(
              enabled: state.locationName == null,
              effect: ShimmerEffect(),
              child: Text(
                'Loading...',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletLandscape(context) ? 70.sp : 35.sp,
                ),
              ),
            );
          },
          buildWhen: (previous, current) {
            if (previous.runtimeType != current.runtimeType) {
              return true;
            }

            if (current is AirQualityLoadSuccess &&
                previous is AirQualityLoadSuccess) {
              return (current.locationName != previous.locationName);
            }

            if (previous != current) {
              return true;
            }

            return false;
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

  Widget _pageBreakHeaderSection(TextTheme textTheme, BuildContext context) {
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

  Widget _separator() {
    return Container(color: Colors.white, width: 1.w, height: .5.sh);
  }

  Widget _airQualitySection(
    TextTheme textTheme,
    BuildContext context,
    bool isLightThemed,
  ) {
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
              sizedH8,
              BlocBuilder<AirQualityBloc, AirQualityState>(
                builder: (context, state) {
                  final _isSuccess = state is AirQualityLoadSuccess;
                  final _isError = state is AirQualityLoadFailure;
                  final _isLoading = state is AirQualityLoadInProgress;

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

                  if (_isSuccess) {
                    final _pollutants = state.data;
                    final aqiValue = AirQualityHelpers.getAirQualityIndex(
                      aQModels: _pollutants,
                    );
                    final aqiRelativeConcentration =
                        AirQualityHelpers.getRelativeConcentration(aqiValue);
                    return _displayGaugeWithData(
                      aqiValue,
                      aqiRelativeConcentration,
                      context,
                      textTheme,
                    );
                  }
                  return _shimmerGaugeOnLoading(
                    context,
                    isLightThemed,
                    _isLoading,
                    textTheme,
                  );
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
              ),
            ],
          ),

          Flexible(
            child: BlocBuilder<AirQualityBloc, AirQualityState>(
              builder: (context, state) {
                final _isSuccess = state is AirQualityLoadSuccess;
                final _isError = state is AirQualityLoadFailure;

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
                if (_isSuccess) {
                  final _pollutants = state.data;

                  final _filteredPollutants =
                      _pollutants
                          .where(
                            (pollutant) =>
                                pollutant.pollutantSymbol == 'CO' ||
                                pollutant.pollutantSymbol == 'O₃' ||
                                pollutant.pollutantSymbol == 'PM25',
                          )
                          .toList();
                  return _showPollutantsStateHandler(_filteredPollutants);
                }

                return _shimmerOnLoading(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Skeletonizer _shimmerOnLoading(BuildContext context) {
    return Skeletonizer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AirQualityPollutantSummaryCard(
            aqIconPath: AssetPath.coIcon,
            aqParameterName: 'Carbon 1',
            aqParameterUnit: 'µmm/g',
            aqParameterValue: 5.0,
          ),
          isTabletLandscape(context) ? sizedW32 : sizedW24,
          AirQualityPollutantSummaryCard(
            aqIconPath: AssetPath.pm25Icon,
            aqParameterName: 'PM 2.5',
            aqParameterValue: 100,
            aqParameterUnit: 'µmm/g',
          ),
          isTabletLandscape(context) ? sizedW32 : sizedW24,
          AirQualityPollutantSummaryCard(
            aqIconPath: AssetPath.o3Icon,
            aqParameterName: 'Ozone',
            aqParameterValue: 2.5,
            aqParameterUnit: 'µmm/g',
          ),
        ],
      ),
    );
  }

  ListView _showPollutantsStateHandler(
    List<AirQualityPollutantModel> _filteredPollutants,
  ) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: _filteredPollutants.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final requiredPollutant = _filteredPollutants[index];
        return AirQualityPollutantSummaryCard(
          aqIconPath: AssetPath.mapPollutantToIcon(
            requiredPollutant.pollutantSymbol,
          ),
          aqParameterName: requiredPollutant.pollutantName,
          aqParameterValue: requiredPollutant.getPollutantConcIn(),
          aqParameterUnit: requiredPollutant.getPollutantUnitStringFor(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: .04.sw);
      },
    );
  }

  Widget _shimmerGaugeOnLoading(
    BuildContext context,
    bool isLightThemed,
    bool _isLoading,
    TextTheme textTheme,
  ) {
    return CircularPercentIndicator(
      progressColor: Colors.grey,
      curve: Curves.bounceIn,
      percent: 0.0,
      radius: isTabletLandscape(context) ? 20.r : 50.r,
      arcType: ArcType.FULL,
      arcBackgroundColor: Colors.grey,
      animateFromLastPercent: true,
      animateToInitialPercent: true,
      center: Skeletonizer(
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
        enabled: _isLoading,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'loading...',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: isPhoneLandscape(context) ? 14.sp : 24.sp,
                ),
              ),
              Text(
                'loading',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: isPhoneLandscape(context) ? 12.sp : 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      lineWidth: isTabletLandscape(context) ? 8.w : 4.w,
    );
  }

  Widget _displayGaugeWithData(
    double? aqiValue,
    double aqiRelativeConcentration,
    BuildContext context,
    TextTheme textTheme,
  ) {
    return CircularPercentIndicator(
      progressColor: AirQualityHelpers.mapValueToColor(aqiValue!),
      curve: Curves.bounceIn,
      percent: aqiRelativeConcentration,
      radius: isTabletLandscape(context) ? 20.r : 50.r,
      arcType: ArcType.FULL,
      arcBackgroundColor: Colors.grey,
      animateFromLastPercent: true,
      animateToInitialPercent: true,
      center: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${(aqiRelativeConcentration * 100).toStringAsFixed(2)}%',
              style: textTheme.titleSmall?.copyWith(
                fontSize: isPhoneLandscape(context) ? 14.sp : 24.sp,
              ),
            ),
            Text(
              'AQI',
              style: textTheme.titleSmall?.copyWith(
                fontSize: isPhoneLandscape(context) ? 12.sp : 24.sp,
              ),
            ),
          ],
        ),
      ),
      lineWidth: isTabletLandscape(context) ? 8.w : 4.w,
    );
  }

  Widget _forecastSection(TextTheme textTheme, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('forecast details');
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
