import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class HomeScreenMobileLandscape extends StatelessWidget {
  const HomeScreenMobileLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        sizedH16,
        Text(
          'San Francisco',
          style: textTheme.headlineLarge,
        ),
        Text(
          'May 27, 2025',
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w100,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: 0.67.sw, maxHeight: 0.57.sh),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _forecastSection(textTheme),
                    _separator(),
                    _airQualitySection(textTheme),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _pageBreakHeaderSection(textTheme, context),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 0.39.sw,
                      maxHeight: 200.h,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                      ],
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

  Padding _pageBreakHeaderSection(TextTheme textTheme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Today',
            style: textTheme.headlineSmall,
          ),
          InkWell(
            child: Text(
              'View full report',
              style: textTheme.labelSmall?.copyWith(
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

  Column _airQualitySection(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '200',
              style: textTheme.displayLarge,
            ),
            Text(
              'AQI',
              style: textTheme.titleSmall,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
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
                    width: 30.0.w,
                    height: 30.0.h,
                    color: Colors.white,
                  ),
                  Text(
                    '100',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    'Monoxide',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              sizedW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  Image.asset(
                    AssetPath.pm25Icon,
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  Text(
                    '100',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    'PM 2.5',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              sizedW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  Image.asset(
                    AssetPath.o3Icon,
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  Text(
                    '70',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    'Ozone',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Column _forecastSection(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Lottie.asset(
            AssetPath.animatedSunnyRain,
            width: 50.w,
            height: 50.h,
            fit: BoxFit.cover,
          ),
        ),
        sizedH42,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 8.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(
                    FontAwesomeIcons.thermometer,
                    size: 20.dg,
                  ),
                  Text(
                    '100 C',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Temp.',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
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
                    size: 20.dg,
                  ),
                  Text(
                    '100 Km/hr',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Wind',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
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
                    size: 20.dg,
                  ),
                  Text(
                    '70%',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Humidity',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
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
