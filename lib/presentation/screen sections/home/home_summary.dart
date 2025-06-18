import 'package:bloc_app/presentation/components/air_quality_summary.dart';
import 'package:bloc_app/presentation/components/forcast_summary.dart';
import 'package:bloc_app/utilities/orientation_helpers.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeSummary extends StatefulWidget {
  const HomeSummary({super.key});

  @override
  State<HomeSummary> createState() => _HomeSummaryState();
}

class _HomeSummaryState extends State<HomeSummary> {
  final double segmentedButtonFontSize = 16.sp;
  final double segmentedButtonFontSizeTab = 24.sp;
  late final List<ButtonSegment<int>> _segmentedButtonSegments = [
    ButtonSegment<int>(
      value: 0,
      label: Padding(
        padding: EdgeInsets.all(8.0.dg),
        child: Text(
          'Forecast',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? segmentedButtonFontSizeTab
                    : segmentedButtonFontSize,
          ),
        ),
      ),
    ),
    ButtonSegment<int>(
      value: 1,
      label: Padding(
        padding: EdgeInsets.all(8.0.dg),
        child: Text(
          'Air-Quality',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? segmentedButtonFontSizeTab
                    : segmentedButtonFontSize,
          ),
        ),
      ),
    ),
  ];

  var selectedSegment = <int>{0};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder:
              (child, animation) => SlideTransition(
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
                GestureDetector(
                  child: ForecastSummary(key: const ValueKey(0)),
                  onTap: () {
                    context.pushNamed('forecast details');
                  },
                ),
                GestureDetector(
                  child: AirQualitySummary(key: const ValueKey(1)),
                  onTap: () {
                    context.pushNamed('air quality details');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
