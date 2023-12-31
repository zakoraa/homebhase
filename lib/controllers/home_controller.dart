import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/data/house.dart';

import '../models/house.dart';

class HomeController extends GetxController {
  late final ScrollController scrollController;
  RxInt selectedTab = 0.obs;
  RxBool appBarHasColor = false.obs;
  RxBool isAnimated = false.obs;
  List<House> popularHouse = [];
  List<bool> isItemAnimated = [false, false, false];
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
    _selectPopularHouse();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> startAnimation(dynamic visibilityInfo) async {
    for (int i = 0; i < popularHouse.length; i++) {
      if (visibilityInfo.visibleFraction == 1 && !isItemAnimated[i]) {
        await Future.delayed(Duration(milliseconds: i == 0 ? 0 : 800));
        isItemAnimated[i] = true;
      }
      update();
    }
  }

  void _selectPopularHouse() {
    houseList.sort((a, b) => b.rating.compareTo(a.rating));
    popularHouse = houseList.take(3).toList();
    update();
  }

  void selectTab(int index) {
    selectedTab.value = index;
    update();
  }
}
