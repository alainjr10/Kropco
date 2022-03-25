import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/widgets/custom_appBar.dart';
import 'package:kropco/widgets/diagnostics_screen_btns.dart';

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
        //classifyImage(pickedImage!);
      } else {
        debugPrint('no image');
      }
    });
  }

  Future captureImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        pickedImage = File(pickedFile.path);
        debugPrint('Image Picked from camera');
        //classifyImage(pickedImage!);
        return;
      } else {
        debugPrint('no image');
      }
    });
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
