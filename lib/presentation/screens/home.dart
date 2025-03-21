import 'package:bloc_app/presentation/components/air_quality_summary.dart';
import 'package:bloc_app/presentation/components/forcast_summary.dart';
import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<ButtonSegment<int>> _segmentedButtonSegments = [
    ButtonSegment<int>(
      value: 0,
      label: Text('Forcast'),
    ),
    ButtonSegment<int>(
      value: 1,
      label: Text('Air Quality'),
    ),
  ];

  var selectedSegment = <int>{0};

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: () async {},
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
                  sizedH32,
                  //Todo: Pass Dynamic Location name.
                  Text(
                    'San Francisco',
                    style: textTheme.headlineLarge,
                  ),
                  sizedH16,
                  //Todo: Pass dynamic date string.
                  Text(
                    'May 27, 2025',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  sizedH16,
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
                  sizedH16,
                  AnimatedSwitcher(
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
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
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
                              color: (Theme.of(context).brightness ==
                                      ThemeMode.light)
                                  ? LightColorConstants.secondaryColor_1
                                  : DarkColorConstants.secondaryColor_1,
                            ),
                          ),
                          //Todo: Implement the onTap function.
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  sizedH16,
                  //Todo: Replace with a list view builder to display
                  //Todo: the hourly reports dynamically.
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 100, maxWidth: double.infinity),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
