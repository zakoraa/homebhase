import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/models/house.dart';
import 'package:homebhase/routes/route_name.dart';
import 'package:homebhase/widgets/global/house_image.dart';

import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class HouseBox extends StatelessWidget {
  final House house;
  const HouseBox({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    const double boxHeight = 200;
    return Container(
      clipBehavior: Clip.hardEdge,
      width: Get.width,
      height: boxHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          HouseImage(image: house.thumbnail),
          Positioned(
            bottom: 0,
            width: Get.width - 30,
            height: boxHeight / 2 - 20,
            child: Container(
              color: const Color.fromARGB(60, 0, 0, 0),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                house.name,
                                overflow: TextOverflow.ellipsis,
                                style: text14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$ ${house.price.toInt()}/mo",
                                style: text12.copyWith(color: lightGrey),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: IntrinsicWidth(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: amber,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${house.rating}",
                                        style: text12,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${house.roomMeet} Room meet",
                                style: text12.copyWith(color: lightGrey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
