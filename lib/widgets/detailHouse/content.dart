import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/detail_house_controller.dart';
import 'package:homebhase/themes/app_color.dart';
import 'package:homebhase/themes/app_font.dart';

class DetailHouseContent extends StatelessWidget {
  const DetailHouseContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailHouseController>();
    final house = controller.selectedHouse;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          GetBuilder<DetailHouseController>(
            builder: (_) => Row(
              children: List.generate(
                  controller.stars.length,
                  (index) => controller.isStarAnimated[index]
                      ? FadeIn(
                          duration: const Duration(milliseconds: 600),
                          child: Icon(
                            controller.stars.values.elementAt(index)[0],
                            color: controller.stars.values.elementAt(index)[1],
                            size: 24,
                          ),
                        )
                      : const SizedBox(
                          height: 24,
                          width: 24,
                        )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  house.name,
                  style: text20,
                ),
                const Icon(Icons.favorite_outline_rounded)
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1600),
            child: Text("Description",
                style: text14.copyWith(fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<DetailHouseController>(
            builder: (_) => FadeInUp(
              duration: const Duration(milliseconds: 2000),
              child: RichText(
                text: TextSpan(style: text12, children: [
                  TextSpan(text: controller.getDescriptionSnippet()),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 3,
                  )),
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () {
                      controller.isFullText.toggle();
                      controller.update();
                    },
                    child: Text(
                      controller.isFullText.value ? "less" : "more",
                      style: text12.copyWith(color: primaryColor),
                    ),
                  ))
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
