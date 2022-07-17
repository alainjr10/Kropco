import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as Cfirestore;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/view_models/weather_model.dart';
import 'package:kropco/views/disease_analysis_screen.dart';
import 'package:kropco/views/notifications_screen.dart';
import 'package:kropco/views/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const homeScreenId = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WeatherModel _weatherModel = WeatherModel();
    FirebaseAuth user = FirebaseAuth.instance;
    Cfirestore.FirebaseFirestore firestore =
        Cfirestore.FirebaseFirestore.instance;

    final Map diseaseCount = {};
    List<dynamic> allDiseases = [];
    List<String> tDiseases = [];

    final Future<Cfirestore.QuerySnapshot> allUsers = firestore
        .collection('users')
        .where(Cfirestore.FieldPath.documentId,
            isNotEqualTo: user.currentUser!.uid)
        .get();

    final Future<Cfirestore.DocumentSnapshot> currentUser =
        firestore.collection('users').doc(user.currentUser!.uid).get();

    List<Trending> trendingDiseases = [
      Trending(
        diseaseName: "corn maize common rust ",
        diseaseImageUrl: "10.jpg",
      ),
      Trending(
        diseaseName: "tomato late blight",
        diseaseImageUrl: "34.jpg",
      ),
      Trending(
        diseaseName: "potato late blight",
        diseaseImageUrl: "20.jpg",
      ),
      Trending(
        diseaseName: "corn maize northern leaf blight",
        diseaseImageUrl: "14.jpg",
      ),
      Trending(
        diseaseName: "tomato early blight",
        diseaseImageUrl: "31.jpg",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "KropCo",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, NotificationsScreen.notificationsScreenId);
            },
            icon: const Icon(
              FontAwesomeIcons.bell,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Settings.settingsScreenId);
            },
            icon: const Icon(
              FontAwesomeIcons.gear,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kGeneralBodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning ${user.currentUser?.displayName}",
                          style: kH2TextSyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          "Welcome Back",
                          style: kSubTextTextStyle,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Settings.settingsScreenId);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.circleUser,
                      size: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      height: 190.0,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 22.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Washington DC",
                                        style: kSubTextTextStyle.copyWith(
                                          fontSize: 17,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "25\u2103",
                                        style:
                                            kH1TextSyle.copyWith(fontSize: 35),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "${_weatherModel.getWeatherIcon(330)["icon"]}",
                                        style:
                                            kH1TextSyle.copyWith(fontSize: 35),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "${_weatherModel.getWeatherIcon(330)["condition"]}",
                                        style: kSubTextTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      width: 160,
                      height: 190.0,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 22.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Precipitation",
                                        style: kSubTextTextStyle.copyWith(
                                          fontSize: 17,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "73%",
                                        style:
                                            kH1TextSyle.copyWith(fontSize: 35),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Text(
                                        "Very little chance of rain today",
                                        style: kSubTextTextStyle,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      width: 160,
                      height: 190.0,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 22.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Humidity",
                                        style: kSubTextTextStyle.copyWith(
                                          fontSize: 17,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "88%",
                                        style:
                                            kH1TextSyle.copyWith(fontSize: 35),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "Wind",
                                        style: kSubTextTextStyle.copyWith(
                                          fontSize: 17,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Text(
                                        "NW 11km/h",
                                        style: kH2TextSyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Trending Diseases Around You",
                    style: kH3TextSyle,
                  ),
                  Text(
                    "These are some of the most common diseases users around you have recently reported",
                    style: kSubTextTextStyle.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 12.0),
                  FutureBuilder<Cfirestore.DocumentSnapshot>(
                    future: currentUser,
                    builder: (BuildContext context,
                        AsyncSnapshot<Cfirestore.DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        // set the value of the current users location so as to compare to know his environs
                        ///
                        ///
                        double currentUserLatitude = data["latitude"],
                            currentUserLongitude = data["longitude"];
                        return FutureBuilder<Cfirestore.QuerySnapshot>(
                          future: allUsers,
                          builder: (BuildContext context,
                              AsyncSnapshot<Cfirestore.QuerySnapshot>
                                  allSnapshot) {
                            if (allSnapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (allSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text("Loading");
                            }
                            return ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: allSnapshot.data!.docs
                                  .map((Cfirestore.DocumentSnapshot document) {
                                Map<String, dynamic> dataAltUsers =
                                    document.data()! as Map<String, dynamic>;
                                return FutureBuilder<Cfirestore.QuerySnapshot>(
                                  future: firestore
                                      .collection('users')
                                      .doc(document.id)
                                      .collection('diseases')
                                      // .orderBy('dateTime', descending: false)
                                      .get(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<Cfirestore.QuerySnapshot>
                                          singleUserSnapshot) {
                                    if (singleUserSnapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (singleUserSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading");
                                    }

                                    /// Calculate the distance between the current user and the posted farm to see if they're in close proximity
                                    double distanceInMeters =
                                        Geolocator.distanceBetween(
                                                currentUserLatitude,
                                                currentUserLongitude,
                                                dataAltUsers["latitude"],
                                                dataAltUsers["longitude"])
                                            .roundToDouble();
                                    debugPrint(
                                        "$currentUserLatitude, $currentUserLongitude ${dataAltUsers["latitude"]}");
                                    debugPrint("Distance in meters is " +
                                        distanceInMeters.toString() +
                                        "m");

                                    ///
                                    /// FOR loop which checks various conditions and adds items to the all valid diseases list
                                    /// Here, we add all sorrounded reported crop diseasaes
                                    ///
                                    for (var dName
                                        in singleUserSnapshot.data!.docs) {
                                      Map<String, dynamic> data2 =
                                          dName.data()! as Map<String, dynamic>;
                                      Cfirestore.Timestamp firebaseDate =
                                          data2['dateTime'];

                                      DateTime dateAdded =
                                          firebaseDate.toDate();
                                      if (DateTime.now()
                                                  .difference(dateAdded)
                                                  .inDays <
                                              4 &&
                                          distanceInMeters < 300) {
                                        allDiseases.add(data2['diseaseName'] +
                                            "_" +
                                            data2['coverPhoto']);
                                      }
                                    }
                                    debugPrint("Length of list is: " +
                                        allDiseases.length.toString());

                                    ///
                                    /// After adding all sorrounded diseases to a list, we make a map which contains each disease
                                    /// and its corresponding count, or frequency
                                    ///

                                    for (var element in allDiseases) {
                                      if (!diseaseCount.containsKey(element)) {
                                        diseaseCount[element] = 1;
                                      } else {
                                        diseaseCount[element] += 1;
                                      }
                                    }

                                    ///
                                    /// After getting diseases and their frequencies, we show the diseasaes with the most frequency, as
                                    /// the trending disease
                                    ///
                                    for (var element in diseaseCount.entries) {
                                      if (element.value > 1) {
                                        tDiseases.add(element.key);
                                      }
                                    }
                                    debugPrint(diseaseCount.toString() +
                                        " and the trending count is: " +
                                        tDiseases.length.toString());
                                    return tDiseases.isNotEmpty
                                        ? SizedBox(
                                            height: 400.0,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              itemCount: tDiseases.length,
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                    width: 20.0);
                                              },
                                              itemBuilder: (context, index) {
                                                String dName = tDiseases[index]
                                                    .split("_")
                                                    .first;
                                                String dImage = tDiseases[index]
                                                    .split("_")
                                                    .last;
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      DiseaseAnalysisScreen
                                                          .diseaseAnalysisScreenId,
                                                      // arguments: trendingDiseases[index].diseaseName,
                                                      arguments:
                                                          DiseaseAnalysisScreenArguments(
                                                              diseaseName:
                                                                  dName),
                                                    );
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 350.0,
                                                        width:
                                                            size.width * 0.75,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                20.0),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/alt/$dImage"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      Text(
                                                        dName,
                                                        style: kH3TextSyle,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : const Center(
                                            child: Text(
                                                "No trending diseasaes at the moment"),
                                          );
                                  },
                                );
                                // return ListTile(
                                //   title: Text(data['longitude'].toString()),
                                //   // subtitle: Text(data['company']),
                                // );
                              }).toList(),
                            );
                          },
                        );
                      }

                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
                  ),

                  // SizedBox(
                  //   height: 400.0,
                  //   child: ListView.separated(
                  //     shrinkWrap: true,
                  //     itemCount: trendingDiseases.length,
                  //     scrollDirection: Axis.horizontal,
                  //     separatorBuilder: (context, index) {
                  //       return const SizedBox(width: 20.0);
                  //     },
                  //     itemBuilder: (context, index) {
                  //       return InkWell(
                  //         onTap: () {
                  //           Navigator.pushNamed(
                  //             context,
                  //             DiseaseAnalysisScreen.diseaseAnalysisScreenId,
                  //             // arguments: trendingDiseases[index].diseaseName,
                  //             arguments: DiseaseAnalysisScreenArguments(
                  //                 diseaseName:
                  //                     trendingDiseases[index].diseaseName),
                  //           );
                  //         },
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               height: 350.0,
                  //               width: size.width * 0.75,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: const BorderRadius.all(
                  //                   Radius.circular(20.0),
                  //                 ),
                  //                 image: DecorationImage(
                  //                   image: AssetImage(
                  //                       "assets/alt/${trendingDiseases[index].diseaseImageUrl}"),
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(height: 10.0),
                  //             Text(
                  //               trendingDiseases[index].diseaseName,
                  //               style: kH3TextSyle,
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Trending {
  final String diseaseName;
  final String diseaseImageUrl;

  Trending({required this.diseaseName, required this.diseaseImageUrl});
}
