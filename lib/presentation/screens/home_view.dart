import 'package:bloc_app/presentation/screens/orientation%20controllers/home_orientation_view.dart';
import 'package:bloc_app/presentation/screens/web_view.dart';
import 'package:bloc_app/utilities/screen_sizes.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ScreenSizesConstant.mobileMaxWidth) {
          return HomeScreenOrientationView();
        } else if (constraints.maxWidth > ScreenSizesConstant.mobileMaxWidth &&
            constraints.maxWidth < ScreenSizesConstant.tabletMaxWidth) {
          return HomeScreenOrientationView();
        } else {
          return HomeScreenWebView();
        }
      },
    );
  }
}
