import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/presentation/view_sections/forecast_header.dart';
import 'package:bloc_app/presentation/view_sections/hourly_header_date.dart';
import 'package:bloc_app/presentation/view_sections/next_forecasts.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
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
                    child: HourlyHeaderWithDate(),
                  ),
                  sizedH8,
                  //Search input text form field.
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: isTabletPortrait(context) ? 0.15.sh : 0.12.sh,
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
                  sizedH4,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: NextForecastHeader(),
                  ),
                  NextForecasts()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
