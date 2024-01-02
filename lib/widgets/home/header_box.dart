import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class HomeHeaderBox extends StatelessWidget {
  const HomeHeaderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 120,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/header_home.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            height: Get.height,
            width: Get.width,
            color: blackWOpacity0_3,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Let's buy a house here",
                        style: text16.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Discount 10%",
                        style: text12.copyWith(color: lightGrey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "12 October 2022",
                        style: text12.copyWith(color: lightGrey),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
