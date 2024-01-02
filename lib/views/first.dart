import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/routes/route_name.dart';
import 'package:homebhase/themes/app_color.dart';
import 'package:homebhase/widgets/global/label_brand.dart';

import '../themes/app_font.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const LabelBrand(),
                  const SizedBox(
                    height: 35,
                  ),
                  RichText(
                    text: TextSpan(style: text30, children: const [
                      TextSpan(
                        text: "Looking",
                        style: TextStyle(color: primaryColor),
                      ),
                      WidgetSpan(
                          child: SizedBox(
                        width: 10,
                      )),
                      TextSpan(
                        text: "for an",
                        style: TextStyle(color: secondaryColor),
                      ),
                    ]),
                  ),
                  Text(
                    "elegant house this is the place",
                    style: text30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome friends, are you looking for us?",
                    style: text16.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Congratulations you have found us",
                    style: text16.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 130,
                    child: IntrinsicWidth(
                      child: ElevatedButton(
                          onPressed: () => Get.toNamed(RouteName.home),
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: text14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 3),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SizedBox(
                    width: Get.width,
                    child: Image.asset(
                      "assets/images/modern_house.png",
                      fit: BoxFit.cover,
                    ))),
          ],
        ),
      ),
    );
  }
}
