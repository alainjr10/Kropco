import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kropco/utils/constants.dart';

import 'disease_analysis_screen.dart';

class RecentlyViewed extends StatefulWidget {
  static const recentlyViewedScreenId = "/recently_viewed_screen";
  const RecentlyViewed({Key? key}) : super(key: key);

  @override
  State<RecentlyViewed> createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  List<Recent> recentlyViewedLeaves = [
    Recent(
      diseaseName: "corn maize common rust",
      diseaseImageUrl: "10.jpg",
      viewFrequency: "14",
    ),
    Recent(
      diseaseName: "tomato late blight",
      diseaseImageUrl: "34.jpg",
      viewFrequency: "15",
    ),
    Recent(
      diseaseName: "potato late blight",
      diseaseImageUrl: "20.jpg",
      viewFrequency: "12",
    ),
    Recent(
      diseaseName: "corn maize northern leaf blight",
      diseaseImageUrl: "14.jpg",
      viewFrequency: "19",
    ),
    Recent(
        diseaseName: "tomato early blight",
        diseaseImageUrl: "31.jpg",
        viewFrequency: "17"),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recently Checked Leaves"),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kGeneralBodyPadding),
              child: Text(
                "These are the most recent leaves you have scanned over the last 30 days, and the frequency with which you have scanned each leaf",
                style: kSubTextTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(kGeneralBodyPadding),
              itemCount: recentlyViewedLeaves.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 50.0,
                  thickness: 2.0,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DiseaseAnalysisScreen.diseaseAnalysisScreenId,
                      arguments: recentlyViewedLeaves[index].diseaseName,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250.0,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/alt/${recentlyViewedLeaves[index].diseaseImageUrl}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recentlyViewedLeaves[index].diseaseName,
                            style: kH3TextSyle,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.eye,
                                size: 21.0,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                recentlyViewedLeaves[index].viewFrequency,
                                style: kH3TextSyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Recent {
  final String diseaseName;
  final String diseaseImageUrl;
  final String viewFrequency;

  Recent(
      {required this.diseaseName,
      required this.diseaseImageUrl,
      required this.viewFrequency});
}
