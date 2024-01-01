import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/detail_house_controller.dart';

import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailHouseController>();
    final house = controller.selectedHouse;
    return SizedBox(
      height: controller.previewImageHeight.value,
      width: Get.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: BlurHash(
              hash: "LiDAfcogW?t7Xrj]bIaeIrfkoIWB",
              image: house.thumbnail,
              imageFit: BoxFit.cover,
            ),
          ),
          GetBuilder<DetailHouseController>(
            builder: (_) => Positioned(
                bottom: 15,
                right: 15,
                child: Column(
                  children: List.generate(
                      3,
                      (index) => controller.isItemAnimated[index]
                          ? index == 2 && house.imagePreview.length > 2
                              ? FadeInRight(
                                  duration: const Duration(milliseconds: 1000),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 50,
                                    width: 50,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: BlurHash(
                                            hash:
                                                "LiDAfcogW?t7Xrj]bIaeIrfkoIWB",
                                            image: house.imagePreview[index],
                                            imageFit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: blackWOpacity0_3,
                                        ),
                                        Text(
                                          "+${house.imagePreview.length - 2}",
                                          style: text14.copyWith(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : FadeInRight(
                                  duration: const Duration(milliseconds: 1000),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 50,
                                    width: 50,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: BlurHash(
                                      hash: "LiDAfcogW?t7Xrj]bIaeIrfkoIWB",
                                      image: house.imagePreview[index],
                                      imageFit: BoxFit.cover,
                                    ),
                                  ),
                                )
                          : const SizedBox(
                              height: 60,
                              width: 50,
                            )),
                )),
          )
        ],
      ),
    );
  }
}
