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

bool isPhoneLandscape(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final screenWidth = MediaQuery.of(context).size.width;
  final beyondMobilePortWidth = screenWidth > ScreenSizesConstant.mobileMaxPortWidth;
  final belowMobileLandWidth = screenWidth < ScreenSizesConstant.mobileMaxLandWidth;
  final withinLandscapeWidth = beyondMobilePortWidth && belowMobileLandWidth;
  final inLandscape = orientation == Orientation.landscape;
  final isMobileLandscape = inLandscape && withinLandscapeWidth;
  return isMobileLandscape;
}

bool isTabletLandscape(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final orientation = MediaQuery.of(context).orientation;
  final beyondMobileLandWidth = screenWidth > ScreenSizesConstant.mobileMaxLandWidth;
  final withinTabletLandWidth = screenWidth < ScreenSizesConstant.tabletMaxPortWidth;
  final inLandscape = orientation == Orientation.landscape;
  final isTablet = ((beyondMobileLandWidth && withinTabletLandWidth) && inLandscape);
  return isTablet;
}

bool isTabletPortrait(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final orientation = MediaQuery.of(context).orientation;
  final beyondMobilePortWidth = screenWidth > ScreenSizesConstant.mobileMaxPortWidth;
  final withinTabletPortWidth = screenWidth < ScreenSizesConstant.tabletMaxPortWidth;
  final inPortrait = orientation == Orientation.portrait;
  final isTablet = ((beyondMobilePortWidth && withinTabletPortWidth) && inPortrait);
  return isTablet;
}
