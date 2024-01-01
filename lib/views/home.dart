import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/controllers/home_controller.dart';
import 'package:homebhase/themes/app_color.dart';
import 'package:homebhase/themes/app_font.dart';
import 'package:homebhase/widgets/home/app_bar.dart';
import 'package:homebhase/widgets/home/bottom_bar.dart';
import 'package:homebhase/widgets/home/carousel_house_box.dart';
import 'package:homebhase/widgets/home/header_box.dart';
import 'package:homebhase/widgets/home/popular_today.dart';
import '../widgets/home/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeIn(
                          duration: const Duration(milliseconds: 1000),
                          child: const HomeSearchBar()),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 800),
                          child: const HomeHeaderBox()),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const CarouselHouseBox()),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                            duration: const Duration(milliseconds: 1200),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Popular Today",
                                    style: text18.copyWith(
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    Text("Other",
                                        style: text14.copyWith(
                                            color: primaryColor)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: primaryColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ],
                            )),
                        const PopularToday(),
                      ],
                    )),
                const SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
          const HomeAppBar(),
          const HomeBottomBar()
        ],
      ),
    );
  }
}
