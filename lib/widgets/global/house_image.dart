import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/themes/app_font.dart';

class HouseImage extends StatelessWidget {
  final String image;
  const HouseImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        "assets/images/blur.png",
        fit: BoxFit.cover,
      ),
      FadeInImage.assetNetwork(
        placeholder: "assets/images/blur.png",
        image: image,
        fit: BoxFit.cover,
        placeholderScale: 0.5,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black,
            child: Center(
                child: Text(
              "Failed to load image",
              style: text11.copyWith(color: Colors.grey),
            )),
          );
        },
        placeholderErrorBuilder: (context, error, stackTrace) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black,
            child: Center(
                child: Text(
              "Failed to load image",
              style: text11.copyWith(color: Colors.grey),
            )),
          );
        },
      ),
    ]);
  }
}
