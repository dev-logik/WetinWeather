import 'package:bloc_app/presentation/screens/mobile_view.dart';
import 'package:bloc_app/presentation/screens/web_view.dart';
import 'package:flutter/material.dart';

class HomeScreenGeneral extends StatelessWidget {
  const HomeScreenGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 300 && constraints.maxWidth < 900) {
          return HomeScreenMobile();
        } else {
          return HomeScreenWeb();
        }
      },
    );
  }
}
