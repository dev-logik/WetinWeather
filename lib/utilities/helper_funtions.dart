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

bool isTabletLandscape(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final orientation = MediaQuery.of(context).orientation;
  final beyondMobile = screenWidth > ScreenSizesConstant.mobileMaxLandWidth;
  final withinTablet = screenWidth < ScreenSizesConstant.tabletMaxPortWidth;
  final inLandscape = orientation == Orientation.landscape;
  final isTablet = beyondMobile && withinTablet && inLandscape;
  return isTablet;
}

bool isTabletPortrait(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final orientation = MediaQuery.of(context).orientation;
  final withinMobile = screenWidth > ScreenSizesConstant.mobileMaxPortWidth;
  final withinTablet = screenWidth < ScreenSizesConstant.tabletMaxPortWidth;
  final inPortrait = orientation == Orientation.portrait;
  final isTablet = withinMobile && withinTablet && inPortrait;
  return isTablet;
}
