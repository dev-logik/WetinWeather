import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  final double iconFontSize = 18.sp;

  //Defines the list of bottom navigation bar items.
  late final _bottomNavigationSylishItems = <BottomBarItem>[
    BottomBarItem(
      icon: FaIcon(FontAwesomeIcons.house),
      title: Text('Home'),
      backgroundColor: Colors.white,
    ),
    BottomBarItem(
      icon: FaIcon(FontAwesomeIcons.microscope),
      title: Text('Search'),
      backgroundColor: Colors.white,
    ),
    BottomBarItem(
      icon: FaIcon(FontAwesomeIcons.chartColumn),
      title: Text('Forcast'),
      backgroundColor: Colors.white,
    ),
    BottomBarItem(
      icon: FaIcon(FontAwesomeIcons.gear),
      title: Text('Settings'),
      backgroundColor: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final isMobileNTablet =
        MediaQuery.of(context).size.width <
        ScreenSizesConstant.tabletMaxPortWidth;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar:
              (isMobileNTablet) ? _buildBottomNavigationBar(context) : null,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final isDarkThemed = Theme.of(context).brightness == Brightness.dark;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return StylishBottomBar(
      items: _bottomNavigationSylishItems,
      option: DotBarOptions(
        dotStyle: DotStyle.tile,
        iconSize: isTabletPortrait(context) ? 30.sp : iconFontSize,
        gradient: LinearGradient(
          colors: [
            (isDarkThemed)
                ? DarkColorConstants.gradientColor_1
                : LightColorConstants.gradientColor_1,
            (isLightThemed)
                ? DarkColorConstants.gradientColor_2
                : LightColorConstants.gradientColor_2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      backgroundColor:
          (isDarkThemed)
              ? DarkColorConstants.primaryColor
              : LightColorConstants.primaryColor,
      currentIndex: navigationShell.currentIndex,
      onTap: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: navigationShell.currentIndex == index,
        );
      },
    );
  }
}
