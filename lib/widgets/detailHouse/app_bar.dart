import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/themes/app_color.dart';

import '../../controllers/detail_house_controller.dart';

class DetailHouseAppBar extends StatelessWidget {
  const DetailHouseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailHouseController>();
    const double appBarHeight = 100;
    return GetBuilder<DetailHouseController>(builder: (_) {
      final double opacity = controller.appBarHasColor.value ? 1 : 0;
      final int duration = controller.appBarHasColor.value ? 300 : 0;
      return Positioned(
          top: 0,
          child: Stack(
            children: [
              AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: opacity,
                  child: Container(
                    height: appBarHeight,
                    width: Get.width,
                    color: Colors.white,
                  )),
              SizedBox(
                  width: Get.width,
                  height: appBarHeight,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              size: 25,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: duration),
                          opacity: opacity,
                          child: Container(
                            width: Get.width,
                            height: 1,
                            color: lightGrey,
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ));
    });
  }
}
