import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';
import 'house_list_tile.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchViewController>();
    return GetBuilder<SearchViewController>(
        builder: (_) => ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listSearchResult.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemBuilder: (context, index) {
              return HouseListTile(house: controller.listSearchResult[index]);
            }));
  }
}
