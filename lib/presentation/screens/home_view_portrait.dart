import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/screen sections/home_header.dart';
import 'package:bloc_app/presentation/screen sections/home_summary.dart';
import 'package:bloc_app/presentation/screen sections/hourly_header.dart';
import 'package:bloc_app/presentation/screen sections/hourly_section.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';

class HomeScreenMobilePortrait extends StatefulWidget {
  const HomeScreenMobilePortrait({super.key});

  @override
  State<HomeScreenMobilePortrait> createState() =>
      _HomeScreenMobilePortraitState();
}

class _HomeScreenMobilePortraitState extends State<HomeScreenMobilePortrait> {
  var selectedSegment = <int>{0};

  @override
  Widget build(BuildContext context) {
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
                  HomeHeader(),
                  sizedH8,
                  //Todo: Define a bloc for handling these events
                  HomeSummary(),
                  sizedH8,
                  HourlyHeader(),
                  //Todo: Replace with a list view builder to display
                  //Todo: the hourly reports dynamically.
                  HourlySection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
