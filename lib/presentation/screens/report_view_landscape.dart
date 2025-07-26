import 'package:bloc_app/presentation/screen%20sections/screen_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/utilities.dart';
import '../components/components.dart';

class ForcastReportLandscapeScreen extends StatelessWidget {
  const ForcastReportLandscapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(right: -80.0, top: -80.0, child: GradientSpot()),
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              height: isTabletLandscape(context) ? 0.92.sh : 0.84.sh,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  sizedH24,
                  //Page Header name
                  Text(
                    'Forecast Report',
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize:
                          (isTabletPortrait(context) ||
                                  isTabletLandscape(context))
                              ? 70.sp
                              : null,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: HourlyHeaderWithDate(),
                        ),
                        HourlySection(numberOfForecastToShow: 24),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: NextForecastHeader(),
                        ),
                        NextForecasts(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
