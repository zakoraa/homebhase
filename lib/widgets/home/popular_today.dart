import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/home_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'house_box.dart';

class PopularToday extends StatelessWidget {
  const PopularToday({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return GetBuilder<HomeController>(
        builder: (_) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemBuilder: (context, index) => VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (visibilityInfo) {
                  controller.startAnimation(visibilityInfo);
                },
                child: controller.isItemAnimated[index]
                    ? FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: HouseBox(
                          house: controller.popularHouse[index],
                        ),
                      )
                    : const SizedBox(
                        height: 150,
                      ))));
  }
}
