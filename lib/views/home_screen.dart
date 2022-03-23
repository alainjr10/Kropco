import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const homeScreenId = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home Screen",
      ),
    );
  }
}
