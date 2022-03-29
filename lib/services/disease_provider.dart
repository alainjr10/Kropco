import 'package:flutter/material.dart';
import 'package:kropco/models/disease_model.dart';

class DiseaseService with ChangeNotifier {
  late Disease _disease;
  bool diseaseStatus = false;
  Disease get disease => _disease;

  void setDiseaseValue(Disease disease) {
    _disease = disease;
    diseaseStatus = true;
    notifyListeners();
  }

  void checkIfDiseaseIsSet() {
    diseaseStatus = false;
    notifyListeners();
  }
}
