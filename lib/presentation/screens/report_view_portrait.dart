import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/presentation/components/next_forcast_container.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForcastReportPortraitScreen extends StatelessWidget {
  const ForcastReportPortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              right: -80.0,
              top: -80.0,
              child: GradientSpot(),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  sizedH16,
                  //Page Header name
                  Text(
                    'Forcast Report',
                    style: textTheme.headlineLarge,
                  ),
                  sizedH8,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Today',
                          style: textTheme.headlineSmall,
                        ),
                        Text(
                          'May 27, 2025',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedH8,
                  //Search input text form field.
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 90.h,
                      maxWidth: double.infinity,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                        HourlyReportCard(),
                      ],
                    ),
                  ),
                  sizedH8,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Next Forcast',
                          style: textTheme.headlineSmall,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 8.0.w),
                        ),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 0.56.sh,
                      maxWidth: 1.sw,
                    ),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                        sizedH8,
                        NextForcastCard(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
