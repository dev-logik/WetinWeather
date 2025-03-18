import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
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
  }
}