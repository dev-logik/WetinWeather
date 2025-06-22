import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_app/bloc/cubits.dart';
import 'package:bloc_app/models/models.dart';
import 'package:bloc_app/services/services.dart';
import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../utilities/error_helpers.dart';
import '../components/components.dart';

class AirQualityDetails extends StatefulWidget {
  const AirQualityDetails({super.key});

  @override
  State<AirQualityDetails> createState() => _AirQualityDetailsState();
}

class _AirQualityDetailsState extends State<AirQualityDetails> {
  late final LocationCubit _locationCubit;
  late final AirQualityBloc _airQualityCubit;
  @override
  void initState() {
    super.initState();
    _locationCubit = context.read<LocationCubit>();
    _airQualityCubit = context.read();
    _airQualityCubit.add(LoadInitialDataEvent());
    _locationCubit.startLocationService(
      locationStyleOption: LocationDisplayStyleOptions.CITY_COUNTRY,
    );
  }

  @override
  void dispose() {
    _locationCubit.close();
    _locationCubit.startLocationService(
      locationStyleOption: LocationDisplayStyleOptions.CITY,
    );
    _airQualityCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: _headerSection(context, textTheme, isLightThemed),
              ),
              sizedH24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: _airQualityStateHandler(textTheme, isLightThemed),
              ),
              sizedH24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: _pollutantsStateHandler(textTheme, isLightThemed),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<AirQualityBloc, AirQualityState> _pollutantsStateHandler(
    TextTheme textTheme,
    bool isLightThemed,
  ) {
    return BlocBuilder<AirQualityBloc, AirQualityState>(
      builder: (context, state) {
        final _isError = state is AirQualityLoadFailure;
        final _isSuccess = state is AirQualityLoadSuccess;
        final _isLoading = state is AirQualityLoadInProgress;
        // if (_isError) {
        //   final _error = state.exception;
        //   final _msg = ErrorHelpers.getFriendlyError(_error);
        //   Fluttertoast.showToast(
        //     msg: _msg,
        //     backgroundColor: Colors.redAccent,
        //     textColor: Colors.white,
        //     gravity: ToastGravity.SNACKBAR,
        //     fontSize: 14.sp,
        //   );
        // }
        if (_isSuccess) {
          final _pollutants = state.data;
          return airQualityPollutants(context, textTheme, _pollutants);
        }

        return _shimmerOnLoading(_isLoading, isLightThemed);
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

  BlocBuilder<AirQualityBloc, AirQualityState> _airQualityStateHandler(
    TextTheme textTheme,
    bool isLightThemed,
  ) {
    return BlocBuilder<AirQualityBloc, AirQualityState>(
      builder: (context, state) {
        final _isError = state is AirQualityLoadFailure;
        final _isSuccess = state is AirQualityLoadSuccess;

        if (_isError) {
          final _error = state.exception;
          final _msg = ErrorHelpers.getFriendlyError(_error);
          Fluttertoast.showToast(
            msg: _msg,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 14.sp,
          );
        }

        if (_isSuccess) {
          final _pollutants = state.data;
          final _aqi = AirQualityHelpers.getAirQualityIndex(
            aQModels: _pollutants,
          );
          final _aqiRatio = AirQualityHelpers.getRelativeConcentration(_aqi);
          return _airQualityIndexSection(
            context,
            textTheme,
            isLightThemed,
            _aqiRatio,
            _aqi,
          );
        }
        return _airQualityIndexSection(
          context,
          textTheme,
          isLightThemed,
          null,
          null,
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
    );
  }

  Widget _headerSection(
    BuildContext context,
    TextTheme textTheme,
    bool isLightThemed,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Air Quality",
              style: textTheme.displaySmall?.copyWith(
                fontSize:
                    isTabletPortrait(context)
                        ? 40.sp
                        : isTabletLandscape(context)
                        ? 50.sp
                        : isPhoneLandscape(context)
                        ? 35.sp
                        : 28.sp,
              ),
            ),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state.locationName != null) {
                  return Text(
                    '${state.locationName}',
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize:
                          isTabletPortrait(context)
                              ? 28.sp
                              : isTabletLandscape(context)
                              ? 30.sp
                              : isPhoneLandscape(context)
                              ? 24.sp
                              : 16.sp,
                      color: (isLightThemed) ? Colors.white : Colors.grey,
                    ),
                  );
                }

                return Skeletonizer(
                  enableSwitchAnimation: true,
                  switchAnimationConfig: SwitchAnimationConfig(
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                  ),

                  effect: ShimmerEffect(
                    duration: Duration(milliseconds: 700),

                    baseColor:
                        (isLightThemed)
                            ? LightColorConstants.primaryColor
                            : DarkColorConstants.primaryColor,
                    highlightColor:
                        (isLightThemed)
                            ? LightColorConstants.secondaryColor_2
                            : DarkColorConstants.secondaryColor_2,
                  ),
                  enabled: state.locationName == null,
                  child: Text(
                    'Loading...',
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize:
                          isTabletPortrait(context)
                              ? 28.sp
                              : isTabletLandscape(context)
                              ? 30.sp
                              : isPhoneLandscape(context)
                              ? 24.sp
                              : 16.sp,
                      color: (isLightThemed) ? Colors.white : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton(
            onPressed: () {
              context.pushNamed('home');
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              size: isTabletPortrait(context) ? 24.sp : 14.sp,
              color: isLightThemed ? Colors.white : Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _airQualityIndexSection(
    BuildContext context,
    TextTheme textTheme,
    bool isLightThemed,
    double? aqiRatio,
    double? AQI,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius:
              isTabletPortrait(context)
                  ? 70.r
                  : isTabletLandscape(context)
                  ? 90.r
                  : isPhoneLandscape(context)
                  ? 60.sp
                  : 50.r,
          center: Center(
            child: BlocBuilder<AirQualityBloc, AirQualityState>(
              builder: (context, state) {
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
                  enabled: (aqiRatio == null),
                  child: Text(
                    '${((aqiRatio ?? 0.0) * 100).toStringAsFixed(2)}%',
                    style: textTheme.titleMedium?.copyWith(
                      fontSize:
                          isTabletPortrait(context)
                              ? 24.sp
                              : isTabletLandscape(context)
                              ? 30.sp
                              : isPhoneLandscape(context)
                              ? 22.sp
                              : 20.sp,
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
                  return (current.data != previous.data);
                }

                if (previous != current) {
                  return true;
                }

                return false;
              },
            ),
          ),
          animateToInitialPercent: true,
          animateFromLastPercent: true,
          animation: true,
          arcBackgroundColor: Colors.grey,
          arcType: ArcType.FULL,
          curve: Curves.easeInOut,
          lineWidth:
              isTabletPortrait(context)
                  ? 8.w
                  : isTabletLandscape(context)
                  ? 10.w
                  : 5.w,
          header: Text(
            'AQI',
            style: textTheme.titleMedium?.copyWith(
              fontSize:
                  isTabletPortrait(context)
                      ? 20.sp
                      : isTabletLandscape(context)
                      ? 16.sp
                      : isPhoneLandscape(context)
                      ? 14.sp
                      : 12.sp,
            ),
          ),
          rotateLinearGradient: true,
          progressColor: AirQualityHelpers.mapValueToColor(AQI ?? 0.0),
          percent: aqiRatio ?? 0.0,
          startAngle: 180,
        ),
        SizedBox(
          width: .65.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AirQualityHelpers.mapValueToRemark(AQI ?? 0.0)}',
                style: textTheme.titleMedium?.copyWith(
                  fontSize:
                      isTabletPortrait(context)
                          ? 30.sp
                          : isTabletLandscape(context)
                          ? 35.sp
                          : isPhoneLandscape(context)
                          ? 28.sp
                          : 24.sp,
                ),
              ),
              AutoSizeText(
                'Air quality is acceptable. However, for some pollutants there may be'
                ' a moderate health concern for a very small number of people who are'
                ' unusually sensitive to air pollution.',
                maxLines: 5,
                wrapWords: true,
                textAlign: TextAlign.left,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize:
                      isTabletPortrait(context)
                          ? 18.sp
                          : isTabletLandscape(context)
                          ? 24.sp
                          : isPhoneLandscape(context)
                          ? 18.sp
                          : 14.sp,
                  color: (isLightThemed) ? Colors.white : Colors.grey,
                  fontWeight:
                      isTabletPortrait(context) ? FontWeight.w500 : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget airQualityPollutants(
    BuildContext context,
    TextTheme textTheme,
    List<AirQualityPollutantModel> pollutants,
  ) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: isPhoneLandscape(context) ? 5 / 1.7 : 1,
      ),
      itemCount: pollutants.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        AirQualityPollutantModel pollutantModel;
        pollutantModel = pollutants[index];
        return AirQualityPollutantIndividualCard(
          pollutantName: pollutantModel.pollutantName,
          pollutantSymbol: pollutantModel.pollutantSymbol,
          pollutantConcentration: pollutantModel.getPollutantConcIn(),
          indicatorColor: pollutantModel.mapValueToColor,
          pollutantUnit: pollutantModel.getPollutantUnitStringFor(),
          remark: pollutantModel.remarks,
          relativeConcentration: pollutantModel.relativeConc,
        );
      },
    );
  }

  Skeletonizer _shimmerOnLoading(bool _isLoading, bool isLightThemed) {
    return Skeletonizer(
      switchAnimationConfig: SwitchAnimationConfig(
        switchInCurve: Curves.easeInToLinear,
        switchOutCurve: Curves.elasticInOut,
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
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        children: [
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 50,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 100,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 100,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 100,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 100,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 100,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
          AirQualityPollutantIndividualCard(
            pollutantName: 'loading',
            pollutantSymbol: 'loading',
            pollutantConcentration: 100,
            indicatorColor: Colors.grey,
            pollutantUnit: 'loading',
            remark: 'loading',
            relativeConcentration: 1.0,
          ),
        ],
      ),
    );
  }
}
