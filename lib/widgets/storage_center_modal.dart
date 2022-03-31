import 'package:flutter/material.dart';
import 'package:kropco/utils/constants.dart';

Future<dynamic> storageCenterModal(BuildContext context) {
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
                      text: "Storage Center",
                      style: TextStyle(
                        color: Colors.red,
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 6.0),
              height: 45.0,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 18.0,
                      ),
                      Icon(
                        Icons.work_outline_rounded,
                        size: 25.0,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Text(
                        "See my Jobs (Applied)",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
