import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/home_controller.dart';
import 'package:homebhase/data/house.dart';
import 'package:homebhase/widgets/home/house_box.dart';

import '../../themes/app_color.dart';

class CarouselHouseBox extends StatelessWidget {
  const CarouselHouseBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 200,
          constraints: BoxConstraints(maxHeight: Get.width),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 4),
              autoPlayInterval: const Duration(seconds: 7),
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                controller.selectedIndex.value = index;
              },
            ),
            items: houseList.map<Widget>((house) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: HouseBox(
                  house: house,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        houseList.length > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    houseList.length,
                    (index) => Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == index
                                      ? primaryColor
                                      : lightGrey,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        )),
              )
            : const SizedBox(),
      ],
    );
  }
}
