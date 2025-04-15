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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header_section(textTheme, brightness),
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
              Demarcation(length: 0.5.sw),
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
              forecastSection(textTheme),
              sizedH8,
              weblinkSection(textTheme, brightness),
              sizedH8,
              Align(
                alignment: Alignment.center,
                child: Demarcation(
                  length: 0.95.sw,
                ),
              ),
              sizedH16,
              weatherStatsSection(),
              sizedH8,
              Align(
                alignment: Alignment.center,
                child: Demarcation(length: 0.95.sw),
              ),
              sizedH16,
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed('home');
                  },
                  child: Icon(FontAwesomeIcons.arrowLeft),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ConstrainedBox weatherStatsSection() {
    return ConstrainedBox(
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

  Row weblinkSection(TextTheme textTheme, Brightness brightness) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Details: ',
          style: textTheme.bodyMedium,
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 8.w),
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
    );
  }

  Row forecastSection(TextTheme textTheme) {
    return Row(
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
                style: textTheme.displayLarge?.copyWith(fontSize: 65.sp),
                children: [
                  TextSpan(
                    text: '°',
                    style: textTheme.displayLarge?.copyWith(fontSize: 65.sp),
                  ),
                  TextSpan(
                    text: '\n                  /Real Feel',
                    style: textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
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
    );
  }

  Row header_section(TextTheme textTheme, Brightness brightness) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '21:30',
            style: textTheme.displaySmall,
          ),
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
    );
  }
}
