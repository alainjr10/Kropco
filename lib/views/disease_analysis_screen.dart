import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:kropco/models/diseases_model.dart';

class DiseaseAnalysisScreen extends StatefulWidget {
  static const diseaseAnalysisScreenId = "/disease_analysis_screen";
  const DiseaseAnalysisScreen({Key? key, required this.diseaseName})
      : super(key: key);
  final String diseaseName;

  @override
  State<DiseaseAnalysisScreen> createState() => _DiseaseAnalysisScreenState();
}

class _DiseaseAnalysisScreenState extends State<DiseaseAnalysisScreen> {
  DiseasesModel dModel = DiseasesModel();
  @override
  void initState() {
    super.initState();
    dModel.setVariables(widget.diseaseName);
    debugPrint(
        "disease name ${widget.diseaseName}, scientific name ${dModel.scientificName}");
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
                  height: 100.0,
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
                            color: Colors.black,
                          ),
                        ),
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
