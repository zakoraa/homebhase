import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/search_controller.dart';
import 'package:homebhase/widgets/search/app_bar.dart';
import 'package:homebhase/widgets/search/recommendation.dart';
import 'package:homebhase/widgets/search/search_result.dart';
import '../themes/app_font.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchViewController>();
    return Scaffold(
      body: GetBuilder<SearchViewController>(
        builder: (_) => SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 160,
                    ),
                    if (controller.listSearchResult.isEmpty &&
                        controller.isEmptyText.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommended",
                            style: text18.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Recommendation()
                        ],
                      )
                    else if (controller.listSearchResult.isEmpty &&
                        !controller.isEmptyText.value)
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "No Result",
                          style: text14.copyWith(color: Colors.grey),
                        ),
                      )
                    else
                      const SearchResult(),
                  ],
                ),
              ),
            ),
            const SearchAppBar()
          ]),
        ),
      ),
    );
  }
}
