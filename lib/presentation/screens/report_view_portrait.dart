import 'package:bloc_app/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/utilities.dart';
import '../screen sections/screen_sections.dart';

class ForcastReportPortraitScreen extends StatelessWidget {
  const ForcastReportPortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(right: -80.0, top: -80.0, child: GradientSpot()),
            Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
                height: .9.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    sizedH16,
                    //Page Header name
                    Text(
                      'Forcast Report',
                      style: textTheme.headlineLarge?.copyWith(
                        fontSize: isTabletPortrait(context) ? 70.sp : null,
                      ),
                    ),
                    sizedH8,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: HourlyHeaderWithDate(),
                    ),
                    sizedH8,
                    //Search input text form field.
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: HourlySection(),
                    ),
                    sizedH4,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: NextForecastHeader(),
                    ),
                    Expanded(child: NextForecasts()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
