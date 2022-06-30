import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kropco/utils/constants.dart';

class NotificationsScreen extends StatelessWidget {
  static const notificationsScreenId = "/notifications_screen";
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ANotification> notifications = [
      ANotification(
        notificationTitle: "Corn Common Rust on the rise",
        notificationDescription:
            "There has been a sudden spike in the occurence of corn common rust lately. Many farmers have been reporting this disease from their plots",
        dateAndTime: "2022-06-30 22:43",
      ),
      ANotification(
        notificationTitle: "Corn Common Rust on the rise",
        notificationDescription:
            "There has been a sudden spike in the occurence of corn common rust lately. Many farmers have been reporting this disease from their plots",
        dateAndTime: "2022-06-30 22:59",
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        itemCount: notifications.length,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 20.0,
            thickness: 2.0,
          );
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(
                  right: 10, left: 0.0, top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4.0),
                ),
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45.0,
                    margin: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      FontAwesomeIcons.fireFlameSimple,
                      color: Colors.amber.shade600,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notifications[index].notificationTitle,
                          style: kH4TextSyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          notifications[index].notificationDescription,
                          style: kSubTextTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          notifications[index].dateAndTime,
                          style: kSubTextTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            color: Colors.grey.shade500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ANotification {
  final String notificationTitle;
  final String notificationDescription;
  final String dateAndTime;

  ANotification(
      {required this.notificationTitle,
      required this.notificationDescription,
      required this.dateAndTime});
}
