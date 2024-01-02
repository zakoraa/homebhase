import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                house.name,
                style: text22,
              ),
              GetBuilder<DetailHouseController>(
                builder: (_) => GestureDetector(
                  onTap: () {
                    controller.isLiked.toggle();
                    controller.update();
                  },
                  child: SvgPicture.asset(
                      controller.isLiked.value
                          ? "assets/svg/favorite.svg"
                          : "assets/svg/favorite_outlined.svg",
                      height: 28,
                      width: 28,
                      semanticsLabel: 'favorite_house'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text("Description",
              style: text18.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<DetailHouseController>(
            builder: (_) => RichText(
              text: TextSpan(style: text13, children: [
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
                    style: text14.copyWith(color: primaryColor),
                  ),
                ))
              ]),
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
