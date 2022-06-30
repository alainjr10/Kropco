import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Settings extends StatelessWidget {
  static const settingsScreenId = "/settings_screen";
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    child: Icon(Icons.person),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alain Jr",
                          style: kH3TextSyle.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, EditAccount.editAccountScreenId);
                          },
                          child: const Text(
                            "Edit Account information",
                            style: kSubTextTextStyle,
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
            ),

            // AccountItemsCard(
            //   cardTitle: "My Orders",
            //   cardTapped: () {
            //     // pushNewScreen(context,
            //     //     screen: const MyOrders(), withNavBar: false);
            //   },
            // ),
            // AccountItemsCard(
            //   cardTitle: "Support Tickets",
            //   cardTapped: () {
            //     // pushNewScreen(context,
            //     //     screen: const MyTickets(), withNavBar: false);
            //   },
            // ),
            AccountItemsCard(
              cardTitle: "Language",
              cardTapped: () {
                // pushNewScreen(context,
                //     screen: const MyVendors(), withNavBar: false);
              },
            ),
            AccountItemsCard(
              cardTitle: "Dark Mode",
              cardTapped: () {
                // pushNewScreen(
                //   context,
                //   screen: const MoreAboutUs(),
                //   withNavBar: false,
                // );
              },
            ),
            AccountItemsCard(
              cardTitle: "Get help from us",
              cardTapped: () {
                // pushNewScreen(context,
                //     screen: const GetHelp(), withNavBar: false);
              },
            ),
            AccountItemsCard(
              cardTitle: "App Settings",
              cardTapped: () {
                // pushNewScreen(
                //   context,
                //   screen: const AppSettings(),
                //   withNavBar: false,
                // );
              },
            ),
            AccountItemsCard(
              cardTitle: "Logout",
              cardTapped: () {},
            ),
            const SizedBox(height: 40.0),
            // row which contains social media icons like facebook, whatsapp, twitter, youtube, etc
            // const SocialsContacts(),
            const SizedBox(height: 40.0),
            RichText(
              text: TextSpan(
                text: 'From ',
                style: kH4TextSyle,
                children: [
                  TextSpan(
                    text: 'Innosoft Inc',
                    style: kH3TextSyle.copyWith(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class AccountItemsCard extends StatelessWidget {
  const AccountItemsCard(
      {Key? key, required this.cardTitle, required this.cardTapped})
      : super(key: key);
  final String cardTitle;
  final Function() cardTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: cardTapped,
          title: Text(
            cardTitle,
            style: kH4TextSyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        const Divider(
          height: 2.0,
          thickness: 2.0,
        ),
      ],
    );
  }
}
