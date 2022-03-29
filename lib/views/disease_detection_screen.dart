import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kropco/models/disease_model.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/views/suggestions_screen.dart';
import 'package:kropco/widgets/custom_appBar.dart';
import 'package:kropco/widgets/diagnostics_screen_btns.dart';
import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';

import '../services/classify_image.dart';
import '../services/disease_provider.dart';

class DiseaseDetection extends StatefulWidget {
  static const diseaseDetectionScreenId = "/disease_detection";
  const DiseaseDetection({Key? key}) : super(key: key);

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  File? pickedImage;
  // var output;
  // var index;

  // Future pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       pickedImage = File(pickedFile.path);
  //       debugPrint('Image Picked from gallery');
  //       classifyImage(pickedImage!).then((value) {
  //         setState(() {
  //           debugPrint('Image Classified with value ${value.toString()}');
  //           //output = value;
  //         });
  //       });
  //     } else {
  //       debugPrint('no image');
  //     }
  //   });

  //   // classifyImage(pickedImage!);
  // }

  // Future captureImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     if (pickedFile != null) {
  //       pickedImage = File(pickedFile.path);
  //       debugPrint('Image Picked from camera');
  //       classifyImage(pickedImage!);
  //       return;
  //     } else {
  //       debugPrint('no image');
  //     }
  //   });
  // }

  // Future loadModel() async {
  //   await Tflite.loadModel(
  //       model: 'assets/models/model_unquant.tflite',
  //       labels: 'assets/models/labels.txt');
  // }

  // Future classifyImage(File image) async {
  //   await loadModel();
  //   var output = await Tflite.runModelOnImage(
  //     path: image.path,
  //     numResults: 2,
  //     threshold: 0.5,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );
  //   setState(() {
  //     this.output = output;
  //     index = 0;
  //     debugPrint('output is $output');
  //   });
  //   return output;
  // }

  // var _output;
  // classifyImage(File image) async {
  //   var output = await Tflite.runModelOnImage(path: image.path);
  //   setState(() {
  //     _output = output;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // loadModel().then((value) {
  //   //   setState(() {});
  //   // });
  // }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);
    final Classifier classifier = Classifier();
    late Disease _disease;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: "Diagnostics"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width,
                height: 210,
                constraints: const BoxConstraints(minHeight: 180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: pickedImage == null
                    ? SvgPicture.asset(
                        'assets/svg/diagnostics_screen_avatar.svg',
                        //height: 180,
                      )
                    : Image.file(
                        pickedImage!,
                        fit: BoxFit.fill,
                      ),
              ),
              const SizedBox(
                height: 10.0,
              ),

              /// If we have a suggestion in memory, display the previous suggestion button, so the user can see their most recent diagnosis
              _diseaseService.diseaseStatus == true
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Suggestions.suggestionsScreenId);
                      },
                      child: const Text("Previous suggestion"),
                      style: ElevatedButton.styleFrom(
                          primary: kSecondaryColor,
                          onPrimary: kPrimaryTextColor,
                          textStyle: kH2TextSyle,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fixedSize: Size(size.width, 60),
                          minimumSize: Size(size.width, 70)),
                    )
                  : const SizedBox(),

              const SizedBox(
                height: 20.0,
              ),

              DiagnosticsScreenMainBtn(
                size: size,
                btnCaption: "Take Photo",
                btnIcon: Icons.camera_alt_outlined,
                onPressed: () async {
                  late double _confidence;
                  await classifier
                      .getDisease(imageSource: ImageSource.camera)
                      .then((value) {
                    _disease = Disease(
                        name: value![0]["label"],
                        imagePath: classifier.imageFile.path);
                    _confidence = value[0]["confidence"];
                  });

                  //check confidence
                  if (_confidence > 0.8) {
                    _diseaseService.setDiseaseValue(_disease);
                    Navigator.restorablePushNamed(
                        context, Suggestions.suggestionsScreenId);
                  } else {
                    debugPrint("Not a disease");
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),

              /// Pick image from gallery btn
              DiagnosticsScreenMainBtn(
                size: size,
                btnCaption: "From Gallery",
                btnIcon: Icons.browse_gallery_outlined,
                onPressed: () async {
                  late double _confidence;
                  await classifier
                      .getDisease(imageSource: ImageSource.gallery)
                      .then((value) {
                    debugPrint("Starting diagnosis");
                    _disease = Disease(
                        name: value![0]["label"],
                        imagePath: classifier.imageFile.path);
                    _confidence = value[0]["confidence"];
                  });

                  //check confidence
                  if (_confidence > 0.8) {
                    _diseaseService.setDiseaseValue(_disease);
                    Navigator.restorablePushNamed(
                        context, Suggestions.suggestionsScreenId);
                  } else {
                    debugPrint("Not a disease");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
