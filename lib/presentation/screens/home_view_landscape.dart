import 'package:bloc_app/presentation/screen sections/hourly_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../utilities/utilities.dart';

class HomeScreenMobileLandscape extends StatelessWidget {
  const HomeScreenMobileLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        sizedH24,
        Text(
          'San Francisco',
          style: textTheme.headlineLarge?.copyWith(fontSize: 15.sp),
        ),
        Text(
          'May 27, 2025',
          style: textTheme.headlineSmall?.copyWith(
            fontSize: 8.sp,
          ),
        ),
        isTabletLandscape(context) ? sizedH16 : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: 0.67.sw, maxHeight: 0.55.sh),
              child: Padding(
                padding:
                    EdgeInsets.all(isTabletLandscape(context) ? 1.5.dm : 0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _forecastSection(textTheme, context),
                      _separator(),
                      _airQualitySection(textTheme, context),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _pageBreakHeaderSection(textTheme, context),
                  HourlySection()
                ],
              ),
            ),
          ],
        ),
        sizedH8,
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
            style: isTabletLandscape(context)
                ? textTheme.headlineMedium
                : textTheme.headlineSmall,
          ),
          InkWell(
            child: Text(
              'View full report',
              style: isTabletLandscape(context)
                  ? textTheme.labelLarge?.copyWith(
                      color: (Theme.of(context).brightness == Brightness.light)
                          ? LightColorConstants.secondaryColor_1
                          : DarkColorConstants.secondaryColor_1,
                      fontSize: 5.sp,
                    )
                  : textTheme.labelSmall?.copyWith(
                      color: (Theme.of(context).brightness == Brightness.light)
                          ? LightColorConstants.secondaryColor_1
                          : DarkColorConstants.secondaryColor_1,
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
    return Container(
      color: Colors.white,
      width: 1.w,
      height: 220.h,
    );
  }

  Column _airQualitySection(TextTheme textTheme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '200',
              style: textTheme.displayLarge?.copyWith(
                  fontSize: isTabletLandscape(context) ? 50.sp : 40.sp),
            ),
            Text(
              'AQI',
              style: textTheme.titleSmall?.copyWith(
                fontSize: isTabletLandscape(context) ? 8.sp : 7.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  Image.asset(
                    AssetPath.coIcon,
                    width: isTabletLandscape(context) ? 40.0.w : 40.0.w,
                    height: isTabletLandscape(context) ? 40.0.h : 40.0.h,
                    color: Colors.white,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '33',
                      style: isTabletLandscape(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                          : textTheme.titleSmall?.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'unit',
                          style: isTabletLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Monoxide',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: isTabletLandscape(context) ? 6.sp : 5.sp,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  Image.asset(
                    AssetPath.pm25Icon,
                    width: isTabletLandscape(context) ? 40.0.w : 40.0.w,
                    height: isTabletLandscape(context) ? 40.0.h : 40.0.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '3.3',
                      style: isTabletLandscape(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                          : textTheme.titleSmall?.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'unit',
                          style: isTabletLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'PM 2.5',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: isTabletLandscape(context) ? 6.sp : 5.sp,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  Image.asset(
                    AssetPath.o3Icon,
                    width: isTabletLandscape(context) ? 40.0.w : 40.0.w,
                    height: isTabletLandscape(context) ? 40.0.h : 40.0.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '3.34',
                      style: isTabletLandscape(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                          : textTheme.titleSmall?.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'unit',
                          style: isTabletLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Ozone',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: isTabletLandscape(context) ? 6.sp : 5.sp,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Column _forecastSection(TextTheme textTheme, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Lottie.asset(
            AssetPath.animatedSunnyRain,
            width: isTabletLandscape(context) ? 70.w : 50.w,
            height: isTabletLandscape(context) ? 70.h : 50.h,
            fit: BoxFit.cover,
          ),
        ),
        sizedH42,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 4.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(
                    FontAwesomeIcons.temperatureHalf,
                    size: isTabletLandscape(context) ? 10.dg : 18.dg,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '10',
                      style: isTabletLandscape(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                          : textTheme.titleSmall?.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' °C',
                          style: isTabletLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Temp.',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: isTabletLandscape(context) ? 6.sp : 5.sp,
                    ),
                  ),
                ],
              ),
              sizedW16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(
                    FontAwesomeIcons.wind,
                    size: isTabletLandscape(context) ? 10.dg : 18.dg,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '10',
                      style: isTabletLandscape(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                          : textTheme.titleSmall?.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'm/s',
                          style: isTabletLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    'Wind',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: isTabletLandscape(context) ? 6.sp : 5.sp,
                    ),
                  ),
                ],
              ),
              sizedW16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(
                    FontAwesomeIcons.water,
                    size: isTabletLandscape(context) ? 10.dg : 18.dg,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '33',
                      style: isTabletLandscape(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                          : textTheme.titleSmall?.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '%',
                          style: isTabletLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Humidity',
                    style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: isTabletLandscape(context) ? 6.sp : 5.sp),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
