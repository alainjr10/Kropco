import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kropco/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.appBarTitle, this.backButton})
      : super(key: key);

  final String appBarTitle;
  final backButton; // Should appbar lead with a back button or the edutive logo. Defaults to Logo

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: kPrimaryColor, // For both Android + iOS

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //leadingWidth: 110,
      elevation: 1.0,

      /// icons or logo before the appbar content
      leading: Container(
        margin: const EdgeInsets.only(
          left: 8.0,
        ),
        child: backButton == true
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 26.0,
                ))
            : const SizedBox(),
      ),

      /// the title
      title: Text(appBarTitle),
      centerTitle: true,
    );
  }
}
