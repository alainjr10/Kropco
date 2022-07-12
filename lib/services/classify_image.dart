import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class Classifier {
  late File imageFile;
  late List outputs;
  ProgressDialog? pr;

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
            labels: 'assets/models/labels.txt')
        .then((value) {
      debugPrint("Model loaded successfully");
    });
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

////
  ///
  ///
  /// THE TRANSFERRED SECTION
  ///
  ///
  ///
  ///
  ///
  ///
  Future loadModelfrfr() async {
    debugPrint("DEBUG: Inside Load Model Function");
    //Tflite.close();
    try {
      String? res;
      res = await Tflite.loadModel(
        // model: "assets/alt/model.tflite",
        // labels: "assets/alt/labels.txt",
        model: "assets/models/plant_disease_model.tflite",
        labels: "assets/models/plant_labels.txt",
      );
      debugPrint(res);
    }
    //  on PlatformException {
    //   print('Failed to load model.');
    //   showErrorProcessing(context);
    // }
    catch (e) {
      debugPrint("Error while loading model $e");
      //showErrorProcessing(context);
    }
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }
}
