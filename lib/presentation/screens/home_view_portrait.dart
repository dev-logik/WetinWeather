import 'package:bloc_app/presentation/components/air_quality_summary.dart';
import 'package:bloc_app/presentation/components/forcast_summary.dart';
import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenMobilePortrait extends StatefulWidget {
  const HomeScreenMobilePortrait({super.key});

  @override
  State<HomeScreenMobilePortrait> createState() =>
      _HomeScreenMobilePortraitState();
}

class _HomeScreenMobilePortraitState extends State<HomeScreenMobilePortrait> {
  late final List<ButtonSegment<int>> _segmentedButtonSegments = [
    ButtonSegment<int>(
      value: 0,
      label: Text(
        'Forcast',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 12.sp,
            ),
      ),
    ),
    ButtonSegment<int>(
      value: 1,
      label: Text(
        'Air-Quality',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 12.sp,
            ),
      ),
    ),
  ];

  var selectedSegment = <int>{0};

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                  //Todo: Pass Dynamic Location name.
                  Text(
                    'San Francisco',
                    style: textTheme.headlineLarge,
                  ),
                  sizedH8,
                  //Todo: Pass dynamic date string.
                  Text(
                    'May 27, 2025',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  sizedH8,
                  //Todo: Define a bloc for handling these events
                  SegmentedButton<int>(
                    segments: _segmentedButtonSegments,
                    selected: selectedSegment,
                    showSelectedIcon: false,
                    onSelectionChanged: (segmentValue) {
                      setState(() {
                        selectedSegment = segmentValue;
                      });
                    },
                  ),
                  sizedH8,
                  _summaryPagesSection(),
                  _pageBreakHeader(textTheme, context),
                  //Todo: Replace with a list view builder to display
                  //Todo: the hourly reports dynamically.
                  _hourlyReportSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ConstrainedBox _hourlyReportSection() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100.w, maxWidth: double.infinity),
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

  Padding _pageBreakHeader(TextTheme textTheme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Today',
            style: textTheme.headlineSmall,
          ),
          InkWell(
            child: Text(
              'View full report',
              style: textTheme.labelSmall?.copyWith(
                color: (Theme.of(context).brightness == Brightness.light)
                    ? LightColorConstants.secondaryColor_1
                    : DarkColorConstants.secondaryColor_1,
              ),
            ),
            //Todo: Implement the onTap function.
            onTap: () {},
          ),
        ],
      ),
    );
  }

  AnimatedSwitcher _summaryPagesSection() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      child: KeyedSubtree(
        key: ValueKey(selectedSegment.first),
        child: IndexedStack(
          index: selectedSegment.first,
          children: [
            ForcastSummary(
              key: const ValueKey(0),
            ),
            AirQualitySummary(
              key: const ValueKey(1),
            ),
          ],
        ),
      ),
    );
  }
}
