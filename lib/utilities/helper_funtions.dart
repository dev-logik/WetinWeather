import 'package:bloc_app/utilities/screen_sizes.dart';
import 'package:flutter/material.dart';

double setLandscapeValues({
  required double ifTrue,
  required double ifFalse,
  required BuildContext context,
}) {
  final orientation = MediaQuery.of(context).orientation;
  return (orientation == Orientation.landscape) ? ifTrue : ifFalse;
}

bool isTablet(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final withinMobile = screenWidth > ScreenSizesConstant.mobileMaxWidth;
  final withinTablet = screenWidth < ScreenSizesConstant.tabletMaxWidth;
  final isTablet = withinMobile && withinTablet;
  return isTablet;
}
