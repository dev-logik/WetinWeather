import 'package:bloc_app/bloc/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../utilities/utilities.dart';
import '../components/components.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  late final LocationCubit locationStateProvider;
  @override
  void initState() {
    super.initState();
    context.read<DateTimeCubit>().startTime();
    locationStateProvider = context.read<LocationCubit>();
    locationStateProvider.startLocationService();
  }

  @override
  void dispose() {
    super.dispose();
    context.read<DateTimeCubit>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(parent: CarouselScrollPhysics()),
            children: [
              sizedH8,
              headerSection(textTheme, brightness, context),
              locationNameSection(textTheme),
              sizedH4,
              Demarcation(length: 0.4.sw),
              sizedH8,
              _weatherDetailText(textTheme, context),
              sizedH8,
              forecastSection(textTheme, context),
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: weblinkSection(textTheme, brightness, context),
              ),
              isPhoneLandscape(context) ? sizedH4 : sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(thickness: 1.2.sp, color: Colors.white),
              ),
              sizedH16,
              weatherStatsSection(),
              isPhoneLandscape(context) ? sizedH4 : sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(thickness: 1.2.sp, color: Colors.white),
              ),
              sizedH16,
              _buttonSection(context, brightness),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<LocationState> locationNameSection(TextTheme textTheme) {
    return StreamBuilder<LocationState>(
      stream: locationStateProvider.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            '${snapshot.data?.locationName}',
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
          effect: ShimmerEffect(),
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
      },
    );
  }

  Align _buttonSection(BuildContext context, Brightness brightness) {
    return Align(
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {
          context.pushNamed('home');
        },
        child: Icon(
          FontAwesomeIcons.arrowLeft,
          size: isTabletPortrait(context) ? 30.sp : 14.sp,
          color: (brightness == Brightness.light) ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  RichText _weatherDetailText(TextTheme textTheme, BuildContext context) {
    return RichText(
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
    );
  }

  ConstrainedBox weatherStatsSection() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        //maxHeight: 0.32.sh,
        minWidth: double.infinity,
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

  Row weblinkSection(
    TextTheme textTheme,
    Brightness brightness,
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
                      (brightness == Brightness.light)
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

  Row forecastSection(TextTheme textTheme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          FontAwesomeIcons.sun,
          size: isTabletLandscape(context) ? 95.sp : 80.sp,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
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
          ],
        ),
      ],
    );
  }

  Row headerSection(
    TextTheme textTheme,
    Brightness brightness,
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
          onPressed: () {},
          icon: Icon(
            brightness == Brightness.light
                ? FontAwesomeIcons.solidSun
                : FontAwesomeIcons.moon,
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
}
