import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const dashboardScreenId = "/dashboard";
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Dashboard Screen"),
    );
  }
}
