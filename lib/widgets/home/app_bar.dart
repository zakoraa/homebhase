import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/home_controller.dart';
import 'package:homebhase/themes/app_color.dart';

import '../global/label_brand.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    const double appBarHeight = 100;
    return GetBuilder<HomeController>(builder: (_) {
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const LabelBrand(),
                              SvgPicture.asset("assets/svg/notification.svg",
                                  height: 23,
                                  width: 23,
                                  semanticsLabel: 'notification_home'),
                            ],
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
