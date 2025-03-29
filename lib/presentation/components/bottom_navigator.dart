import 'package:bloc_app/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  //Defines the list of bottom navigation bar items.
  late final _bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      tooltip: 'Home',
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_rounded),
      activeIcon: Icon(Icons.search_rounded),
      tooltip: 'Search',
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.insert_chart_outlined_rounded),
      activeIcon: Icon(Icons.insert_chart_rounded),
      tooltip: 'Forcast',
      label: 'Forcast',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      activeIcon: Icon(Icons.settings_suggest_sharp),
      tooltip: 'Settings',
      label: 'Settings',
    ),
  ];

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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              items: _bottomNavigationBarItems,
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                //Handles the actual navigation when an item is selected on the
                //bottom navigation bar.
                navigationShell.goBranch(
                  index,
                  initialLocation: navigationShell.currentIndex == index,
                );
              },
            ),
          );
        } else {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: StylishBottomBar(
              items: _bottomNavigationSylishItems,
              option: DotBarOptions(
                dotStyle: DotStyle.circle,
                iconSize: 24,
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
            ),
          );
        }
      },
    );
  }
}
