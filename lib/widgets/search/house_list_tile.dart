import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/models/house.dart';
import 'package:homebhase/widgets/global/house_image.dart';

import '../../controllers/search_controller.dart';
import '../../routes/route_name.dart';
import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class HouseListTile extends StatelessWidget {
  final House house;
  const HouseListTile({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchViewController>();
    return Container(
      height: 130,
      width: Get.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(children: [
        Row(
          children: [
            SizedBox(
                height: 130,
                width: 130,
                child: HouseImage(image: house.thumbnail)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 40, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      house.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text16.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${house.price}",
                      style: text12.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      house.description,
                      style: text10.copyWith(color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: 0,
            right: 10,
            child: FadeInDown(
              delay: Duration(milliseconds: controller.isInit.value ? 0 : 2200),
              duration: const Duration(milliseconds: 400),
              child: Container(
                height: 45,
                width: 30,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        "${house.rating}",
                        style: text11.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Positioned.fill(
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.detailHouse,
                          arguments: {"house": house});
                    },
                    child: Container(
                      color: Colors.transparent,
                    ))))
      ]),
    );
  }
}
