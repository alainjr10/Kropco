import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/widgets/custom_appBar.dart';
import 'package:kropco/widgets/diagnostics_screen_btns.dart';
import 'package:tflite/tflite.dart';

class DiseaseDetection extends StatefulWidget {
  static const diseaseDetectionScreenId = "/disease_detection";
  const DiseaseDetection({Key? key}) : super(key: key);

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  File? pickedImage;
  var output;
  var index;

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        pickedImage = File(pickedFile.path);
        debugPrint('Image Picked from gallery');
        classifyImage(pickedImage!).then((value) {
          setState(() {
            debugPrint('Image Classified with value ${value.toString()}');
            //output = value;
          });
        });
      } else {
        debugPrint('no image');
      }
    });

    // classifyImage(pickedImage!);
  }

  Future captureImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        pickedImage = File(pickedFile.path);
        debugPrint('Image Picked from camera');
        classifyImage(pickedImage!);
        return;
      } else {
        debugPrint('no image');
      }
    });
  }

  Future loadModel() async {
    await Tflite.loadModel(
        model: 'assets/models/model_unquant.tflite',
        labels: 'assets/models/labels.txt');
  }

  Future classifyImage(File image) async {
    await loadModel();
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      this.output = output;
      index = 0;
      debugPrint('output is $output');
    });
    return output;
  }

  // var _output;
  // classifyImage(File image) async {
  //   var output = await Tflite.runModelOnImage(path: image.path);
  //   setState(() {
  //     _output = output;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
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

              output != null
                  ? Text(
                      "${output[0]['label']}",
                      style: kH1TextSyle,
                    )
                  : Container(),

              /// capture image from camera btn
              DiagnosticsScreenMainBtn(
                size: size,
                btnCaption: "Take Photo",
                btnIcon: Icons.camera_alt_outlined,
                onPressed: () {
                  setState(() {
                    captureImage();
                  });
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
                onPressed: () {
                  setState(() {
                    pickImage();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
