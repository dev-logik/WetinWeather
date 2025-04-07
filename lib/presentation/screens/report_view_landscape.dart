import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/presentation/components/next_forecast_container.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForcastReportLandscapeScreen extends StatelessWidget {
  const ForcastReportLandscapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
                  style: isTabletLandscape(context)
                      ? textTheme.headlineLarge?.copyWith(fontSize: 15.sp)
                      : textTheme.headlineLarge,
                ),

                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: isPhoneLandscape(context) ? 0.65.sh : 0.80.sh,
                  ),
                  child: ListView(
                    children: [
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
                              style: isTabletLandscape(context)
                                  ? textTheme.headlineMedium
                                  : textTheme.headlineSmall,
                            ),
                            Text(
                              'May 27, 2025',
                              style: isTabletLandscape(context)
                                  ? textTheme.bodyLarge?.copyWith(
                                      color: Colors.white, fontSize: 6.sp)
                                  : textTheme.headlineSmall
                                      ?.copyWith(fontSize: 7.sp),
                            ),
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              isTabletLandscape(context) ? 0.21.sh : 0.25.sh,
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
                            HourlyReportCard(),
                            HourlyReportCard(),
                            HourlyReportCard(),
                          ],
                        ),
                      ),
                      //isTablet(context) ? sizedH8 : Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Next Forcast',
                              style: isTabletLandscape(context)
                                  ? textTheme.headlineMedium
                                  : textTheme.headlineSmall,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.calendar_month,
                                size: isPhoneLandscape(context) ? 18.dg : 8.dg,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0.h,
                                horizontal: 8.0.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard(),
                      sizedH8,
                      NextForecastCard()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
