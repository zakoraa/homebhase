import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';
import '../../themes/app_color.dart';
import '../../themes/app_font.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchViewController>();

    return Positioned(
        top: 0,
        child: GetBuilder<SearchViewController>(
          builder: (_) => Container(
            color: Colors.white,
            width: Get.width,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 28,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search",
                              style: text20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: text13,
                          controller: controller.searchText,
                          onChanged: (text) {
                            controller.onSearch(text);
                            if (text.isNotEmpty) {
                              controller.isEmptyText.value = false;
                            } else {
                              controller.isEmptyText.value = true;
                            }
                            controller.update();
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: bgSearch,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              prefixIconConstraints: const BoxConstraints(
                                maxHeight: 50,
                                maxWidth: 50,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 10),
                                child: SvgPicture.asset("assets/svg/search.svg",
                                    colorFilter: const ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                    semanticsLabel: 'Search'),
                              ),
                              hintText: "search here...",
                              suffixIcon: controller.isEmptyText.value
                                  ? const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        controller.searchText.clear();
                                        controller.isEmptyText.value = true;
                                        controller.listSearchResult = [];
                                        controller.update();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 25,
                                        ),
                                      ),
                                    )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 1,
                    color: bgSearch,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
