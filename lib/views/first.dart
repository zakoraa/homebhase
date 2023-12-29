import 'package:flutter/material.dart';
import 'package:homebhase/themes/app_color.dart';

import '../themes/app_font.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(style: text20, children: const [
                      WidgetSpan(
                          child: Icon(
                        Icons.home,
                        color: secondaryColor,
                        size: 30,
                      )),
                      TextSpan(
                        text: "Home",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: primaryColor),
                      ),
                      TextSpan(
                        text: "bhase",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: secondaryColor),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 40,
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
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome friends, are you looking for us?",
                    style: text18.copyWith(color: Colors.grey),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Congratulations you have found us",
                    style: text18.copyWith(color: Colors.grey),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: IntrinsicWidth(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: text14.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 20,
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
            Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      "assets/modern_house.png",
                      fit: BoxFit.cover,
                    )))
          ],
        ),
      ),
    );
  }
}
