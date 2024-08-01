import 'package:drivelog/pages/home.dart';
import 'package:drivelog/pages/settings.dart';
import 'package:drivelog/pages/stats.dart';
import 'package:flutter/material.dart';
import "dart:math" show pi;

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [const HomePage(),const StatsPage(),const SettingsPage()][selectedIndex],
      bottomNavigationBar:  Transform.translate(
        offset: Offset.fromDirection(pi/2,15),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (i) => {
            setState(() {
              selectedIndex = i;
              })
          },
          backgroundColor: Theme.of(context).dividerColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.directions_car),
              icon: Icon(Icons.directions_car_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bar_chart),
              icon: Icon(Icons.bar_chart),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings),
              label: 'Home',
            ),
          ],
        ),
      )
    );
  }
}
