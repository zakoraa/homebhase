import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/search_controller.dart';
import 'package:homebhase/widgets/search/house_list_tile.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchViewController>();
    return GetBuilder<SearchViewController>(
        builder: (_) => ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.recommendedHouseList.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemBuilder: (context, index) {
              return controller.isItemAnimated[index]
                  ? FadeInUp(
                      duration: Duration(
                          milliseconds: controller.isInit.value ? 0 : 600),
                      child: HouseListTile(
                          house: controller.recommendedHouseList[index]))
                  : const SizedBox(
                      height: 150,
                    );
            }));
  }
}
