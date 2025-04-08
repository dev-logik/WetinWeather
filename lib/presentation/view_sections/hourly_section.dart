import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourlySection extends StatelessWidget {
  const HourlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: isTabletPortrait(context)
            ? 0.15.sh
            : isTabletLandscape(context)
                ? 0.25.sh
                : isPhoneLandscape(context)
                    ? 0.30.sh
                    : 0.13.sh,
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
    );
  }
}