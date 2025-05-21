import 'package:bloc_app/presentation/screens/home_view_landscape.dart';
import 'package:bloc_app/presentation/screens/home_view_portrait.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

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
