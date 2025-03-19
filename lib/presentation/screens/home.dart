import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<ButtonSegment<String>> _segmentedButtonSegments = [
    ButtonSegment<String>(
      value: 'forcast',
      label: Text('Forcast'),
    ),
    ButtonSegment<String>(
      value: 'airQuality',
      label: Text('Air Quality'),
    ),
  ];

  var selectedSegment = <String>{'forcast'};

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
                  //TODO: Pass Dynamic Location name.
                  Text(
                    'San Francisco',
                    style: textTheme.headlineLarge,
                  ),
                  sizedH16,
                  //Todo:Pass dynamic date string.
                  Text(
                    'May 27, 2025',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  sizedH32,
                  //Todo:Define a bloc for handling these events
                  SegmentedButton<String>(
                    segments: _segmentedButtonSegments,
                    selected: selectedSegment,
                    showSelectedIcon: false,
                    onSelectionChanged: (segmentValue) {
                      setState(() {
                        selectedSegment = segmentValue;
                      });
                    },
                  ),

                  _forcastPage(
                      context, AssetPath.animatedCloudyLighting, textTheme),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Today',
                          style: textTheme.headlineSmall,
                        ),
                        InkWell(
                          child: Text('View full report',
                              style: textTheme.labelSmall),
                          //Todo: Implement the onTap function.
                          onTap: () {
                            print('Hello');
                          },
                        ),
                      ],
                    ),
                  ),
                  //Todo: replace with a list view builder to display
                  //the hourly reports dynamically.
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

  Widget _forcastPage(
      BuildContext context, String assetPath, TextTheme textTheme) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 400, minWidth: 350),
      child: Column(
        children: <Widget>[
          Lottie.asset(
            assetPath,
            height: 300,
            width: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(FontAwesomeIcons.thermometer),
                  Text(
                    '100 C',
                    style: textTheme.titleMedium,
                  ),
                  Text('Temperature'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(FontAwesomeIcons.wind),
                  Text(
                    '100 Km/hr',
                    style: textTheme.titleMedium,
                  ),
                  Text('Wind'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: Check if an icon can replace this.
                  //Todo: the values will be passed dynamically.
                  FaIcon(FontAwesomeIcons.water),

                  Text(
                    '70%',
                    style: textTheme.titleMedium,
                  ),
                  Text('Humidity'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
