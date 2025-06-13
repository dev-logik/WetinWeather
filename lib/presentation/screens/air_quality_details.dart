import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_app/bloc/cubits.dart';
import 'package:bloc_app/data/repositories/air_quality_repository.dart';
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

import '../components/components.dart';

class AirQualityDetails extends StatefulWidget {
  const AirQualityDetails({super.key});

  @override
  State<AirQualityDetails> createState() => _AirQualityDetailsState();
}

class _AirQualityDetailsState extends State<AirQualityDetails> {
  late final LocationCubit locationCubit;
  late final AirQualityRepository requestBody;
  @override
  void initState() {
    super.initState();
    locationCubit = context.read<LocationCubit>();
    locationCubit.startLocationService(
      locationStyleOption: LocationDisplayStyleOptions.CITY_COUNTRY,
    );
  }

  @override
  void dispose() {
    locationCubit.startLocationService(
      locationStyleOption: LocationDisplayStyleOptions.CITY,
    );
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
                child: _airQualityIndexSection(
                  context,
                  textTheme,
                  isLightThemed,
                ),
              ),
              sizedH24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: airQualityParameters(context, textTheme),
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
            StreamBuilder<LocationState>(
              stream: locationCubit.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data?.locationName}',
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
                if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: snapshot.error.toString(),
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    gravity: ToastGravity.SNACKBAR,
                    fontSize: 14.sp,
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
                  enabled: !snapshot.hasData,
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
            child: Text(
              '25%',
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
          footer: Text(
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
          onPercentValue: (value) {},
          rotateLinearGradient: true,
          progressColor: Colors.green,
          percent: .40,
          startAngle: 180,
        ),
        SizedBox(
          width: .65.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good',
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

  Widget airQualityParameters(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AirQualityParameterCard(
              parameterName: ' (Particles < 2.5µm)',
              parameterSymbol: 'PM25',
              parameterValue: '17.59',
            ),
            AirQualityParameterCard(
              parameterName: ' (Nitrogen Dioxide)',
              parameterSymbol: 'NO₂',
              parameterValue: '18.89',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AirQualityParameterCard(
              parameterName: ' (Ozone)',
              parameterSymbol: 'O₃',
              parameterValue: '79.49',
            ),
            AirQualityParameterCard(
              parameterName: ' (Sulphur Dioxide)',
              parameterSymbol: 'SO₂',
              parameterValue: '5.09',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AirQualityParameterCard(
              parameterName: ' (Carbon Monoxide)',
              parameterSymbol: 'CO',
              parameterValue: '1360.59',
            ),
            AirQualityParameterCard(
              parameterName: ' (Particles < 10µm)',
              parameterSymbol: 'PM10',
              parameterValue: '34.24',
            ),
          ],
        ),
      ],
    );
  }
}
