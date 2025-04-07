import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                ],
              ),
              Text(
                'San Francisco',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w100,
                  decorationColor: Colors.white,
                  textBaseline: TextBaseline.alphabetic,
                  fontSize: 35.sp,
                ),
              ),
              Container(
                height: 1,
                width: 0.558.sw,
                color: Colors.white,
              ),
              RichText(
                text: TextSpan(
                  text: 'Today',
                  style: textTheme.headlineSmall?.copyWith(),
                  children: [
                    TextSpan(
                      text: '  28.12.23',
                      style: textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
