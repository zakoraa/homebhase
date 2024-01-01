import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/themes/app_font.dart';

import '../../controllers/detail_house_controller.dart';

class PayNow extends StatelessWidget {
  const PayNow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailHouseController>();
    final house = controller.selectedHouse;
    return Positioned(
        bottom: 0,
        child: FadeInUp(
          duration: const Duration(milliseconds: 1500),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: text14,
                    ),
                    Text(
                      "\$ ${house.price}",
                      style: text23,
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(horizontal: 30)),
                    child: Text(
                      "Pay now",
                      style: text14.copyWith(color: Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }
}
