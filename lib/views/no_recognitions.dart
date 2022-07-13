import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';

class NoRecognitions extends StatelessWidget {
  static const noRecognitionsScreenId = "/no_recognitions";
  const NoRecognitions({Key? key}) : super(key: key);

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
                        Image.asset('assets/alt/nia.jpg'),
                        Image.asset('assets/alt/nia2.jpg'),
                        Image.asset('assets/alt/nia.jpg'),
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
                            children: const <Widget>[
                              Text(
                                // 'Apple Cedar Rust',
                                "No Recognitions found for this image. Try Again",
                                style: TextStyle(
                                  fontFamily: "VT323",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Sorry, we were unable to identify this crop',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 207, 171, 171),
                                ),
                              ),
                            ],
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
        const SizedBox(height: 20.0),
        // widget.recognitions!.length > 1

        const Padding(
          padding: EdgeInsets.only(top: 60, bottom: 20, left: 14),
          child: Text(
            'SYMPTOMS',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            "N/A",
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
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
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'N/A',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
          child: Text(
            'MANAGEMENT (REMEDIES)',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'N/A',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
          child: Text(
            'CHEMICAL/BIOLOGICAL CONTROL',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'N/A',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
      ],
    ));
  }
}
