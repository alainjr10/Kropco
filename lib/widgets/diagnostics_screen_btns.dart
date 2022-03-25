import 'package:flutter/material.dart';
import 'package:kropco/utils/constants.dart';

class DiagnosticsScreenMainBtn extends StatelessWidget {
  const DiagnosticsScreenMainBtn({
    Key? key,
    required this.size,
    required this.btnCaption,
    required this.btnIcon,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String btnCaption;
  final IconData btnIcon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        btnIcon,
        size: 40.0,
      ),
      label: Text(btnCaption),
      style: ElevatedButton.styleFrom(
          primary: kSecondaryColor,
          onPrimary: kPrimaryTextColor,
          textStyle: kH2TextSyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          fixedSize: Size(size.width, 100),
          minimumSize: Size(size.width, 80)),
    );
  }
}
