import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kropco/models/disease_model.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/views/disease_analysis_screen.dart';
import 'package:kropco/views/suggestions_screen.dart';
import 'package:kropco/widgets/custom_appBar.dart';
import 'package:kropco/widgets/diagnostics_screen_btns.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;
import 'package:tflite/tflite.dart';

import '../services/classify_image.dart';
import '../services/disease_provider.dart';

const String mobile = "MobileNet";

class DiseaseDetection extends StatefulWidget {
  static const diseaseDetectionScreenId = "/disease_detection";
  const DiseaseDetection({Key? key}) : super(key: key);

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  File? pickedImage;
  ProgressDialog? pr;
  Classifier classifier = Classifier();
  File? _image;
  List? _recognitions;
  String _model = mobile;
  double? _imageHeight;
  double? _imageWidth;
  bool dialVisible = true;
  String? pickedFilePath;
  var rec1;
  var rec2;
  var rec3;
  var rec4;
  var rec5;
  // var output;
  // var index;

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        pickedFilePath = pickedFile.path;
        pickedImage = File(pickedFile.path);
        debugPrint('Image Picked from gallery');
        debugPrint(
            "the path of the image from image picker is: ${pickedImage!}");
        predictImage(pickedImage!);
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
        pickedFilePath = pickedFile.path;
        pickedImage = File(pickedFile.path);
        debugPrint('Image Picked from camera');
        predictImage(pickedImage!);
        return;
      } else {
        debugPrint('no image');
      }
    });
  }

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
  // Future convertFiletoBytes(String filepath) async {
  //   var bufferedImage = await rootBundle.load(filepath);
  //   return bufferedImage.buffer;
  // }

  Future recognizeImage(File image) async {
    print("DEBUG: Inside Recognize Image Function");
    try {
      double percentage = 0.0;
      pr = ProgressDialog(context, type: ProgressDialogType.normal);
      pr!.style(
        message: 'Detecting Disease...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
      );
      var labelForHighest = "";
      double confidence = -1.00;
      // debugPrint("File from pickedfile path is $pickedFilePath");
      // // var imageBytes = (await rootBundle.load(image.path)).buffer;
      // ByteBuffer bytes =
      //     (await rootBundle.load('assets/alt/testfolder/test_common_rust.jpg'))
      //         .buffer;
      // print("image bytes has a value of: $imageBytes");
      final pickedImageByteArray = await pickedImage?.readAsBytes();
      debugPrint(
          "The length of the image array is ${pickedImageByteArray?[3]}");

      // img.Image? oriImage = img.decodeJpg(bytes.asUint8List());
      img.Image? oriImage = img.decodeJpg(pickedImageByteArray!);
      img.Image resizedImage =
          img.copyResize(oriImage!, width: 299, height: 299);
      var recognitions = await Tflite.runModelOnBinary(
        binary: classifier.imageToByteListFloat32(resizedImage, 299, 0, 255.0),
        // numResults: 3,
        // threshold: 0.4,
        numResults: 5,
        threshold: 0.1,
      );
      setState(() {
        _recognitions = recognitions;
        debugPrint("Length of recognitions: ${recognitions?.length}");
        // rec1 = recognitions![0];
        // rec2 = recognitions[1];
        // rec3 = recognitions[2];
        // rec4 = recognitions[1];
        // rec5 = recognitions[2];
      });

      pr!.show();

      Future.delayed(Duration(seconds: 1)).then((onvalue) {
        percentage = percentage + 30.0;
        print(percentage);

        pr!.update(
          progress: percentage,
          message: "Checking Confidence..",
          maxProgress: 100.0,
          progressTextStyle: const TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: const TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
        );

        Future.delayed(const Duration(seconds: 1)).then((value) {
          percentage = percentage + 30.0;
          pr!.update(progress: percentage, message: "Few more seconds...");
          print(percentage);
          Future.delayed(const Duration(seconds: 2)).then((value) {
            percentage = percentage + 30.0;
            pr!.update(progress: percentage, message: "Almost done..");
            print(percentage);

            Future.delayed(const Duration(seconds: 1)).then((value) {
              pr!.hide().whenComplete(() {
                print(pr!.isShowing());
              });
              percentage = 0.0;
            });
          });
        });
      });
      Future.delayed(const Duration(seconds: 6)).then((onValue) {
        print("PR status  ${pr!.isShowing()}");
        if (pr!.isShowing()) {
          pr!.hide().then((isHidden) {
            print(isHidden);
          });
        }
        print("PR status  ${pr!.isShowing()}");

        if (_recognitions!.isEmpty == false) {
          for (int i = 0; i < _recognitions!.length; i++) {
            debugPrint("Rcognitions: ${_recognitions![i]}");
            if (_recognitions![i]['confidence'] > confidence) {
              labelForHighest = _recognitions![i]['label'];
              confidence = _recognitions![i]['confidence'];
            }
          }

          // debugPrint("recognitions: $rec1,\n $rec2 \n $rec3 \n $rec4");

          debugPrint(
              "The leaf label with the highest accuracy is: $labelForHighest");

          debugPrint("and it has a confidence of: ${confidence.toString()}");
          if (confidence.abs() > 0.80) {
            debugPrint(
                "Confidence is high enough: ${confidence.abs()} now navigate to the results screen");
            Navigator.pushNamed(
              context,
              DiseaseAnalysisScreen.diseaseAnalysisScreenId,
              arguments: DiseaseAnalysisScreenArguments(
                diseaseName: labelForHighest,
                recognitions: _recognitions,
              ),
            );
            // resultPage(context, labelForHighest);
          } else {
            debugPrint("Confidence is too low, we don't know this disease");
            Navigator.pushNamed(
              context,
              DiseaseAnalysisScreen.diseaseAnalysisScreenId,
              arguments: DiseaseAnalysisScreenArguments(
                diseaseName: labelForHighest,
                recognitions: _recognitions,
              ),
            );
            // showCustomDialogWithImage(context, labelForHighest);
          }
        } else {
          debugPrint("No recognitions found");
          // showErrorProcessing(context);
        }
      });
    } on Exception {
      debugPrint("Exceptions found");
      // showErrorProcessing(context);
    }
  }

  Future predictImage(File image) async {
    print("DEBUG: Inside Predict Image Function");
    debugPrint("the path of the image is: ${image.path}");
    await recognizeImage(image);
    // await recognizeImageBinary(image);

    FileImage(image)
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageHeight = info.image.height.toDouble();
        _imageWidth = info.image.width.toDouble();
      });
    }));
  }

  onSelect(model) async {
    setState(() {
      _recognitions = null;
    });
    await classifier.loadModelfrfr();
    if (_image != null) predictImage(File(_image!.path));
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //onSelect(mobile);
    if (image == null) return;
    debugPrint("the path of the image from image picker is: ${image.path}");
    predictImage(File(image.path));
  }

  @override
  void initState() {
    super.initState();
    classifier.loadModelfrfr();
    // loadModel().then((value) {
    //   setState(() {});
    // });
  }

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
                  captureImage();
                  // late double _confidence;
                  // await classifier
                  //     .getDisease(imageSource: ImageSource.camera)
                  //     .then((value) {
                  //   // _disease = Disease(
                  //   //     name: value![0]["label"] ?? "",
                  //   //     imagePath: classifier.imageFile.path);
                  //   // _confidence = value[0]["confidence"];
                  // });

                  //check confidence
                  // if (_confidence > 0.8) {
                  //   _diseaseService.setDiseaseValue(_disease);
                  //   Navigator.restorablePushNamed(
                  //       context, Suggestions.suggestionsScreenId);
                  // } else {
                  //   debugPrint("Not a disease");
                  // }
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
                  //getImage();
                  pickImage();
                  // late double _confidence;
                  // await classifier
                  //     .getDisease(imageSource: ImageSource.gallery)
                  //     .then((value) {
                  //   // debugPrint("Starting diagnosis");
                  //   // _disease = Disease(
                  //   //     name: value![0]["label"],
                  //   //     imagePath: classifier.imageFile.path);
                  //   // _confidence = value[0]["confidence"];
                  // });

                  //check confidence
                  // if (_confidence > 0.8) {
                  //   _diseaseService.setDiseaseValue(_disease);
                  //   Navigator.restorablePushNamed(
                  //       context, Suggestions.suggestionsScreenId);
                  // } else {
                  //   debugPrint("Not a disease");
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
