import 'package:flutter/material.dart';

class DiseaseDetection extends StatelessWidget {
  static const diseaseDetectionScreenId = "/disease_detection";
  const DiseaseDetection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Disease detection",
      ),
    );
  }
}
