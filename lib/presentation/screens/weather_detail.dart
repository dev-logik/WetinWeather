import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../components/components.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedH8,
              headerSection(textTheme, brightness, context),
              Text(
                'San Francisco',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  textBaseline: TextBaseline.alphabetic,
                  fontSize: isTabletPortrait(context) ? 60.sp : 30.sp,
                ),
              ),
              sizedH4,
              Demarcation(length: 0.5.sw),
              sizedH8,
              RichText(
                text: TextSpan(
                  text: 'Clear and Sunny',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: isTabletPortrait(context) ? 40.sp : 20.sp,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: '\nDay',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: isTabletPortrait(context) ? 40.sp : 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              sizedH8,
              forecastSection(textTheme, context),
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: weblinkSection(textTheme, brightness, context),
              ),
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(height: 0.sp, color: Colors.grey),
              ),
              sizedH16,
              weatherStatsSection(),
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(height: 0.sp, color: Colors.grey),
              ),
              sizedH16,
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed('home');
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: isTabletPortrait(context) ? 24.sp : 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ConstrainedBox weatherStatsSection() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 0.32.sh,
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
            fontSize: isTabletPortrait(context) ? 35.sp : null,
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
                    fontSize: isTabletPortrait(context) ? 24.sp : null,
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
        Icon(FontAwesomeIcons.sun, size: 80.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                text: '33',
                style: textTheme.displayLarge?.copyWith(
                  fontSize: isTabletPortrait(context) ? 80.sp : 65.sp,
                ),
                children: [
                  TextSpan(
                    text: '°',
                    style: textTheme.displayLarge?.copyWith(fontSize: 65.sp),
                  ),
                  TextSpan(
                    text: '\n                 /Real Feel',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: isTabletPortrait(context) ? 25.sp : 15.sp,
                    ),
                  ),
                  TextSpan(
                    text: '\n                             30°',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: isTabletPortrait(context) ? 30.sp : 18.sp,
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
          child: Text(
            '21:30',
            style: textTheme.titleMedium?.copyWith(
              fontSize: isTabletPortrait(context) ? 30.sp : 18.sp,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            brightness == Brightness.light
                ? FontAwesomeIcons.solidSun
                : FontAwesomeIcons.moon,
            size: isTabletPortrait(context) ? 30.sp : 24.sp,
          ),
        ),
      ],
    );
  }
}
