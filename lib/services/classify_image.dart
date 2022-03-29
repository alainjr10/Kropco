import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Classifier {
  late File imageFile;
  late List outputs;

  Future<List?> getDisease({required ImageSource imageSource}) async {
    var image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return null;
    imageFile = File(image.path);
    await loadModel();
    var result = await classifyImage(imageFile);
    Tflite.close();
    return result;
  }

 Future loadModel() async {
   /// Load the Tensorflow Lite model.
    await Tflite.loadModel(
        model: 'assets/models/model_unquant.tflite',
        labels: 'assets/models/labels.txt');
  }

  Future<List?> classifyImage(File image) async {
    if (image == null) {
      return null;
    }
    imageFile = image;
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    outputs = output!;
    return output;
  }
}
