import 'package:bloc_app/presentation/screens/mobile_view_landscape.dart';
import 'package:bloc_app/presentation/screens/mobile_view_portrait.dart';
import 'package:flutter/material.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return Center(child: HomeScreenMobileLandscape());
      } else {
        return Center(child: HomeScreenMobilePortrait());
      }
    });
  }
}
