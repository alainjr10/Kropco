import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/view_models/weather_model.dart';
import 'package:kropco/views/disease_analysis_screen.dart';
import 'package:kropco/views/notifications_screen.dart';
import 'package:kropco/views/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  static const homeScreenId = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WeatherModel _weatherModel = WeatherModel();

    List<Trending> trendingDiseases = [
      Trending(
        diseaseName: "corn maize common rust",
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
                      children: const [
                        Text(
                          "Good Morning Alain",
                          style: kH2TextSyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
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
                  SizedBox(
                    height: 400.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: trendingDiseases.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 20.0);
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DiseaseAnalysisScreen.diseaseAnalysisScreenId,
                              // arguments: trendingDiseases[index].diseaseName,
                              arguments: DiseaseAnalysisScreenArguments(
                                  diseaseName:
                                      trendingDiseases[index].diseaseName),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 350.0,
                                width: size.width * 0.75,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/alt/${trendingDiseases[index].diseaseImageUrl}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                trendingDiseases[index].diseaseName,
                                style: kH3TextSyle,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
