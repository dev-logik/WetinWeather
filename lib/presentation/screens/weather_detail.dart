import 'package:bloc_app/bloc/theme_mode_cubit.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '21:30',
                    style: textTheme.displaySmall,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      brightness == Brightness.light
                          ? FontAwesomeIcons.solidSun
                          : FontAwesomeIcons.moon,
                      size: 14.dg,
                    ),
                  )
                ],
              ),
              Text(
                'San Francisco',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  textBaseline: TextBaseline.alphabetic,
                  fontSize: 30.sp,
                ),
              ),
              sizedH4,
              Container(
                height: 1,
                width: 0.5.sw,
                color: Colors.white,
              ),
              sizedH8,
              RichText(
                text: TextSpan(
                  text: 'Clear and Sunny',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: '\nDay',
                      style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              sizedH8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    FontAwesomeIcons.cloudShowersWater,
                    size: 60.dg,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '33',
                          style:
                              textTheme.displayLarge?.copyWith(fontSize: 65.sp),
                          children: [
                            TextSpan(
                              text: '°',
                              style: textTheme.displayLarge
                                  ?.copyWith(fontSize: 65.sp),
                            ),
                            TextSpan(
                              text: '\n                  /Real Feel',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontSize: 15.sp),
                            ),
                            TextSpan(
                              text: '\n                             30°',
                              style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              sizedH8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Details: ',
                    style: textTheme.bodyMedium,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.5.h, horizontal: 8.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'www.7timer.com',
                            style: textTheme.bodyMedium?.copyWith(
                                color: (brightness == Brightness.light)
                                    ? LightColorConstants.primaryColor
                                    : DarkColorConstants.tertiaryColor),
                          ),
                          sizedW4,
                          Icon(Icons.link,
                              color: (brightness == Brightness.light)
                                  ? LightColorConstants.primaryColor
                                  : DarkColorConstants.tertiaryColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              sizedH8,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 1,
                  width: 0.95.sw,
                  color: Colors.white,
                ),
              ),
              sizedH16,
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 0.31.sh,
                  minWidth: double.infinity,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 16.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.wind),
                                    sizedW8,
                                    Text(
                                      'Wind',
                                      style: textTheme.bodyMedium
                                          ?.copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '7.6',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.sp,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' m/s',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 25.sp,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 16.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.droplet),
                                    sizedW8,
                                    Text(
                                      'Humidity',
                                      style: textTheme.bodyMedium
                                          ?.copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '7',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.sp,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' %',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 25.sp,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 16.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.compass),
                                    sizedW8,
                                    Text(
                                      'Direction',
                                      style: textTheme.bodyMedium
                                          ?.copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'NE',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 16.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.temperatureHalf),
                                    sizedW8,
                                    Text(
                                      'Temperature',
                                      style: textTheme.bodyMedium
                                          ?.copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '33',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.sp,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' °C',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 25.sp,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 16.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.icicles),
                                    sizedW8,
                                    Text(
                                      'Prec. Type',
                                      style: textTheme.bodyMedium
                                          ?.copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Snow',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 16.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.temperatureHalf),
                                    sizedW8,
                                    Text(
                                      'Prec. Amount',
                                      style: textTheme.bodyMedium
                                          ?.copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '10',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.sp,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' mm/hr',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 25.sp,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizedH8,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 1,
                  width: 0.95.sw,
                  color: Colors.white,
                ),
              ),
              sizedH16,
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed('home');
                  },
                  child: Text('<'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
