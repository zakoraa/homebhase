import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final ScrollController scrollController;
  RxInt selectedTab = 0.obs;
  RxBool appBarHasColor = false.obs;
  final List<Map<String, dynamic>> tabs = [
    {
      "icon": Icons.home_outlined,
      "icon_active": Icons.home_rounded,
      "name": "Home"
    },
    {
      "icon": Icons.favorite_outline_rounded,
      "icon_active": Icons.favorite_rounded,
      "name": "Favorite"
    },
    {
      "icon": Icons.settings_outlined,
      "icon_active": Icons.settings_rounded,
      "name": "Settings"
    },
    {
      "icon": Icons.person_outlined,
      "icon_active": Icons.person_rounded,
      "name": "Profile"
    },
  ];

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > 0) {
        appBarHasColor.value = true;
      } else {
        appBarHasColor.value = false;
      }
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void selectTab(int index) {
    selectedTab.value = index;
    update();
  }
}
