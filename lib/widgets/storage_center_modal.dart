import 'package:flutter/material.dart';
import 'package:kropco/utils/constants.dart';

Future<dynamic> storageCenterModal(
    BuildContext context, String centerName, Size size) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    elevation: 6.0,
    context: context,
    builder: (BuildContext context) {
      return Container(
        //margin: EdgeInsets.only(bottom: 6.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        //height: 150.0,
        constraints: const BoxConstraints.expand(height: 250.0),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 11.0, horizontal: 6.0),
              //height: 45.0,
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: "Name: ",
                  style: kSubTextTextStyle,
                  children: [
                    TextSpan(
                      text: centerName,
                      style: const TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 6.0,
              thickness: 2.0,
              color: kPrimaryColor.withOpacity(0.9),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Get Directions"),
              style: ElevatedButton.styleFrom(
                primary: kSecondaryColor,
                onPrimary: kPrimaryTextColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                fixedSize: Size(size.width, 45.0),
              ),
              icon: const Icon(Icons.directions_outlined),
            ),
            Divider(
              height: 6.0,
              thickness: 2.0,
              color: kPrimaryColor.withOpacity(0.9),
            ),
          ],
        ),
      );
    },
  );
}
