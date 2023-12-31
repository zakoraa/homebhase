import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/home_controller.dart';
import 'package:homebhase/themes/app_color.dart';
import 'package:homebhase/themes/app_font.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Positioned(
      bottom: 0,
      width: Get.width,
      child: FadeInUp(
          duration: const Duration(milliseconds: 2500),
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GetBuilder<HomeController>(
                  builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(controller.tabs.length, (index) {
                          final bool isSelectedTab =
                              controller.selectedTab.value == index;
                          return GestureDetector(
                            onTap: () => controller.selectTab(index),
                            child: Container(
                              width: Get.width / 4 - 3,
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Icon(
                                    isSelectedTab
                                        ? controller.tabs
                                            .elementAt(index)["icon_active"]
                                        : controller.tabs
                                            .elementAt(index)["icon"],
                                    color: isSelectedTab
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    controller.tabs.elementAt(index)["name"],
                                    style: text10.copyWith(
                                        color: isSelectedTab
                                            ? primaryColor
                                            : Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      )))),
    );
  }
}
