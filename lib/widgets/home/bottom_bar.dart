import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/home_controller.dart';
import 'package:homebhase/themes/app_color.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Positioned(
      bottom: 0,
      width: Get.width,
      child: Container(
          height: 65,
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
                        onTapUp: (details) {
                          controller.iconSize.value =
                              controller.initialIconSize.value;
                          controller.textSize.value =
                              controller.initialTextSize.value;
                          controller.update();
                        },
                        onTapDown: (details) {
                          controller.iconSize.value = 23;
                          controller.textSize.value = 8;
                          controller.selectTab(index);
                          controller.update();
                        },
                        onTapCancel: () {
                          controller.iconSize.value =
                              controller.initialIconSize.value;
                          controller.textSize.value =
                              controller.initialTextSize.value;
                          controller.update();
                        },
                        child: Container(
                          width: Get.width / 4 - 3,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  isSelectedTab
                                      ? controller.tabs
                                          .elementAt(index)["icon_active"]
                                      : controller.tabs
                                          .elementAt(index)["icon"],
                                  height: isSelectedTab
                                      ? controller.iconSize.value
                                      : controller.initialIconSize.value,
                                  width: isSelectedTab
                                      ? controller.iconSize.value
                                      : controller.initialIconSize.value,
                                  semanticsLabel: controller.tabs
                                      .elementAt(index)["name"]),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                controller.tabs.elementAt(index)["name"],
                                style: TextStyle(
                                    fontWeight: isSelectedTab
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    fontSize: isSelectedTab
                                        ? controller.textSize.value
                                        : controller.initialTextSize.value,
                                    color: isSelectedTab
                                        ? primaryColor
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ))),
    );
  }
}
