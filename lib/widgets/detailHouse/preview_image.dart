import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: Get.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/header_home.jpg",
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: Column(
                children: List.generate(
                    3,
                    (index) => index == 2
                        ? Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    "assets/header_home.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: blackWOpacity0_3,
                                ),
                                Text(
                                  "+5",
                                  style: text14.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              "assets/header_home.jpg",
                              fit: BoxFit.cover,
                            ),
                          )),
              ))
        ],
      ),
    );
  }
}
