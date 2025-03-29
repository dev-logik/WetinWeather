import 'package:bloc_app/presentation/screens/report_view_landscape.dart';
import 'package:bloc_app/presentation/screens/report_view_portrait.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (orientation == Orientation.portrait) {
          return ForcastReportPortraitScreen();
        } else {
          return ForcastReportLandscapeScreen();
        }
      },
    );
  }
}
