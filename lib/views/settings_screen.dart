import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const settingsScreenId = "/settings_screen";
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settings",
      ),
    );
  }
}
