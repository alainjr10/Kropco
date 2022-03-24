import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/views/disease_detection_screen.dart';
import 'package:kropco/views/home_screen.dart';
import 'package:kropco/views/settings_screen.dart';
import 'package:kropco/views/storage_centers_screen.dart';

class Home extends StatefulWidget {
  static const homeWithBottomNavbarId = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List _screens = [
    const HomeScreen(),
    const DiseaseDetection(),
    const StorageCenters(),
    const Settings(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Use this code if you just want to go back to 0th index
        if (_currentIndex == 0) return true;
        setState(() {
          _currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 15.0,
          //selectedItemColor: kPrimaryColor,
          unselectedItemColor: kPrimaryTextColor,
          selectedItemColor: kSecondaryTextColor,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          iconSize: 22.0,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plantWilt),
              label: "Diagnostics",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.boxArchive),
              label: "Storage",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
