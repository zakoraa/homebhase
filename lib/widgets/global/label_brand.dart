import 'package:flutter/material.dart';

import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class LabelBrand extends StatelessWidget {
  const LabelBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: text20, children: [
        WidgetSpan(
            child: Image.asset(
          "assets/images/home.png",
          height: 27,
        )),
        const WidgetSpan(
            child: SizedBox(
          width: 5,
        )),
        const TextSpan(
          text: "Home",
          style: TextStyle(fontWeight: FontWeight.w600, color: primaryColor),
        ),
        const TextSpan(
          text: "bhase",
          style: TextStyle(fontWeight: FontWeight.w600, color: secondaryColor),
        ),
      ]),
    );
  }
}
