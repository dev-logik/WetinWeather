import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  //Defines the list of bottom navigation bar items.
  late final _bottomNavigationSylishItems = <BottomBarItem>[
    BottomBarItem(
      icon: FaIcon(
        FontAwesomeIcons.house,
        size: 14.sp,
      ),
      title: Text('Home'),
      backgroundColor: Colors.white,
    ),
    BottomBarItem(
      icon: FaIcon(
        FontAwesomeIcons.microscope,
        size: 14.sp,
      ),
      title: Text('Search'),
      backgroundColor: Colors.white,
    ),
    BottomBarItem(
      icon: FaIcon(
        FontAwesomeIcons.chartColumn,
        size: 14.sp,
      ),
      title: Text('Forcast'),
      backgroundColor: Colors.white,
    ),
    BottomBarItem(
      icon: FaIcon(
        FontAwesomeIcons.gear,
        size: 14.sp,
      ),
      title: Text('Settings'),
      backgroundColor: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final isMobileNTablet = MediaQuery.of(context).size.width <
        ScreenSizesConstant.tabletMaxPortWidth;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar:
            (isMobileNTablet) ? _buildBottomNavigationBar(context) : null,
      );
    });
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return StylishBottomBar(
      items: _bottomNavigationSylishItems,
      option: DotBarOptions(
        dotStyle: DotStyle.tile,
        iconSize: 18.dg,
        gradient: LinearGradient(
          colors: [
            (Theme.of(context).brightness == Brightness.dark)
                ? DarkColorConstants.gradientColor1
                : LightColorConstants.gradientColor_1,
            (Theme.of(context).brightness == Brightness.dark)
                ? DarkColorConstants.gradientColor_2
                : LightColorConstants.gradientColor_2
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      backgroundColor: (Theme.of(context).brightness == Brightness.dark)
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
