import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/detail_house_controller.dart';
import 'package:homebhase/widgets/detailHouse/app_bar.dart';
import 'package:homebhase/widgets/detailHouse/content.dart';
import 'package:homebhase/widgets/detailHouse/pay_now.dart';
import 'package:homebhase/widgets/detailHouse/preview_image.dart';

class DetailHouseView extends StatelessWidget {
  const DetailHouseView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailHouseController>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: const Column(
              children: [
                PreviewImage(),
                SizedBox(
                  height: 10,
                ),
                DetailHouseContent()
              ],
            ),
          ),
          const DetailHouseAppBar(),
          const PayNow()
        ],
      ),
    );
  }
}
