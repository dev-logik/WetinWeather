import 'package:bloc_app/presentation/screens/orientation%20controllers/home_orientation_view.dart';
import 'package:bloc_app/presentation/screens/web_view.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 300 && constraints.maxWidth < 900) {
          return HomeScreenOrientationView();
        } else {
          return HomeScreenWebView();
        }
      },
    );
  }
}
