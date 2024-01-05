import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/detail_house_controller.dart';
import '../../models/house.dart';
import '../../themes/app_font.dart';

class DetailPreviewImage extends StatelessWidget {
  final House house;
  const DetailPreviewImage({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailHouseController>();
    return GestureDetector(
      onTap: () => Get.back(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(165, 0, 0, 0),
        body: Center(
          child: Hero(
            tag: "zoom_post",
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: GetBuilder<DetailHouseController>(
                builder: (_) => SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 15,
                          right: 15,
                          child: SafeArea(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "${controller.selectedIPreviewImage.value + 1}/${house.imagePreview.length}",
                              ),
                            ),
                          )),
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayAnimationDuration: const Duration(seconds: 4),
                          autoPlayInterval: const Duration(seconds: 7),
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            controller.selectedIPreviewImage.value = index;
                            controller.update();
                          },
                        ),
                        items: house.imagePreview.map<Widget>((image) {
                          return SizedBox(
                              width: Get.width,
                              child: Image.network(
                                image,
                                fit: BoxFit.fitWidth,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: Get.height,
                                    width: Get.width,
                                    color:
                                        const Color.fromARGB(255, 22, 22, 22),
                                    child: Center(
                                        child: Text(
                                      "Failed to load image",
                                      style:
                                          text11.copyWith(color: Colors.white),
                                    )),
                                  );
                                },
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
