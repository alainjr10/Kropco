import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kropco/models/diseases_model.dart';
import 'package:kropco/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DiseaseAnalysisScreen extends StatefulWidget {
  static const diseaseAnalysisScreenId = "/disease_analysis_screen";
  const DiseaseAnalysisScreen(
      {Key? key, required this.diseaseName, this.recognitions})
      : super(key: key);
  final String diseaseName;
  final List<dynamic>? recognitions;

  @override
  State<DiseaseAnalysisScreen> createState() => _DiseaseAnalysisScreenState();
}

class _DiseaseAnalysisScreenState extends State<DiseaseAnalysisScreen> {
  DiseasesModel dModel = DiseasesModel();
  List<dynamic>? altRecognitions;
  double? labelForHighest;
  Color? progressColor;
  FirebaseAuth user = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addDiseaseToFirebase(String diseaseName, coverPhoto) async {
    firestore
        .collection('users')
        .doc(user.currentUser!.uid)
        .collection('diseases')
        .add({
      "diseaseName": diseaseName,
      "coverPhoto": coverPhoto,
      "dateTime": DateTime.now(),
    }).then((value) {
      debugPrint("Added diseases");
    }).catchError((onError) => debugPrint("Failed to add disease: $onError "));
  }

  @override
  void initState() {
    super.initState();
    labelForHighest =
        widget.recognitions != null ? widget.recognitions![0]['confidence'] : 0;
    progressColor = labelForHighest! < 0.50
        ? Colors.red
        : labelForHighest! < 0.75
            ? Colors.orange
            : Colors.green;
    dModel.setVariables(widget.diseaseName);
    altRecognitions = widget.recognitions != null
        ? List.from(widget.recognitions!.toList())
        : [];
    altRecognitions!.length > 0 ? altRecognitions!.removeAt(0) : [];
    // altRecognitions!.removeAt(0);
    debugPrint(
        "disease name ${widget.diseaseName}, scientific name ${dModel.scientificName}");
    debugPrint("The image url is: " + dModel.images[0]);
    addDiseaseToFirebase(widget.diseaseName, dModel.images[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
                height: 300.0,
                child: Stack(
                  children: <Widget>[
                    Carousel(
                      images: [
                        Image.asset('assets/alt/${dModel.images[0]}'),
                        Image.asset('assets/alt/${dModel.images[1]}'),
                        Image.asset('assets/alt/${dModel.images[2]}'),
                        // AssetImage('assets/4.jpg'),
                        // // Photo from https://unsplash.com/photos/2d4lAQAlbDA
                        // AssetImage('assets/5.jpg'),
                        // // Photo from https://unsplash.com/photos/FqqiAvJejto
                        // AssetImage('assets/6.jpg'),
                        // // Photo from https://unsplash.com/photos/_-JR5TxKNSo
                      ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      autoplay: false,
                      dotColor: Colors.white,
                      indicatorBgPadding: 50.0,
                      dotBgColor: Colors.transparent,
                      borderRadius: false,
                      moveIndicatorFromBottom: 200.0,
                      noRadiusForIndicator: true,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 270, left: 20, right: 20),
              child: Container(
                  height: 140.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2.0)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                // 'Apple Cedar Rust',
                                widget.diseaseName,
                                style: const TextStyle(
                                  fontFamily: "VT323",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${dModel.scientificName}',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 207, 171, 171),
                                ),
                              ),
                            ],
                          ),
                        ),
                        labelForHighest != 0
                            ? SizedBox(
                                width: 75.0,
                                child: CircularPercentIndicator(
                                  radius: 35.0,
                                  lineWidth: 11.0,
                                  animation: true,
                                  percent: 0.7,
                                  center: Text(
                                    "${(labelForHighest! * 100).round()}%",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  footer: const Text(
                                    "Match",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                        color: kPrimaryColor),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: progressColor,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        // widget.recognitions!.length > 1
        altRecognitions!.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
                child: Column(
                  children: [
                    const Text(
                      "Alternative Results",
                      style: kH3TextSyle,
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "These are other results we were able to detect. In case you were not satisfied with the above result, you should check out these alternatives",
                      style: kSubTextTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    const Divider(thickness: 2.0),
                    ListView.separated(
                      itemCount: altRecognitions!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 2.0);
                      },
                      itemBuilder: (context, index) {
                        debugPrint(
                            "recognition ${altRecognitions![index]['confidence']}");
                        double confidenceMatch =
                            (altRecognitions![index]['confidence'] * 100);
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DiseaseAnalysisScreen.diseaseAnalysisScreenId,
                              arguments: DiseaseAnalysisScreenArguments(
                                  diseaseName: DiseaseMap()
                                      .diseasesMap[altRecognitions![index]
                                          ['label']]!
                                      .diseaseName),
                            );
                          },
                          child: SizedBox(
                              // height: 75.0,
                              child: Row(
                            children: [
                              Container(
                                width: 75.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/alt/${DiseaseMap().diseasesMap[altRecognitions![index]['label']]!.coverImgUrl}",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 8.0),
                                    Text(
                                      altRecognitions![index]['label'],
                                      style: kH4TextSyle,
                                    ),
                                    Text(
                                      DiseaseMap()
                                          .diseasesMap[altRecognitions![index]
                                              ['label']]!
                                          .scientificName,
                                      // .toString(),
                                      style: kSubTextTextStyle.copyWith(
                                          fontSize: 14.0),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "Match ${confidenceMatch.round()}%",
                                      style: kH3TextSyle,
                                    ),
                                    const SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        );
                      },
                    ),
                    const Divider(thickness: 2.0, height: 0),
                  ],
                ),
              )
            : const SizedBox(),
        const Padding(
          padding: EdgeInsets.only(top: 60, bottom: 20, left: 14),
          child: Text(
            'SYMPTOMS',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            "${dModel.symptoms}",
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            textAlign: TextAlign.justify,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
          child: Text(
            'FAVORABLE ENVIRONMENT CONDITIONS',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '${dModel.favourableConditions}',
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        dModel.lifeCycleImage != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 14, right: 14),
                child: Image.asset('assets/alt/${dModel.lifeCycleImage}'),
              )
            : const SizedBox(),
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
          child: Text(
            'MANAGEMENT (REMEDIES)',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '${dModel.remedies}',
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
          child: Text(
            'CHEMICAL/BIOLOGICAL CONTROL',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '${dModel.control}',
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
      ],
    ));
  }

  Widget amenities(
    String url1,
    String url2,
    String url3,
    String features1,
    String features2,
    String features3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url1,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features1)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url2,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features2)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url3,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features3)
              ],
            )),
      ],
    );
  }

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}

class DiseaseAnalysisScreenArguments {
  final String diseaseName;
  final List<dynamic>? recognitions;
  DiseaseAnalysisScreenArguments(
      {required this.diseaseName, this.recognitions});
}
