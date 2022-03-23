import 'package:flutter/material.dart';
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
          unselectedItemColor: Colors.black54,
          type: BottomNavigationBarType.fixed,
          iconSize: 28.0,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: "Quiz",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: "Downloads",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
