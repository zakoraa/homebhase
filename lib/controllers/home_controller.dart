import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/data/house.dart';

import '../models/house.dart';

class HomeController extends GetxController {
  late final ScrollController scrollController;
  RxInt selectedTab = 0.obs;
  RxInt oldSelectedTab = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxDouble initialIconSize = 25.0.obs;
  RxDouble initialTextSize = 10.0.obs;
  RxDouble iconSize = 28.0.obs;
  RxDouble textSize = 10.0.obs;
  RxBool appBarHasColor = false.obs;
  RxBool isAnimated = false.obs;
  List<House> popularHouse = [];
  List<bool> isItemAnimated = [];
  final List<Map<String, dynamic>> tabs = [
    {
      "icon": "assets/svg/home_outlined.svg",
      "icon_active": "assets/svg/home.svg",
      "name": "Home"
    },
    {
      "icon": "assets/svg/favorite_outlined.svg",
      "icon_active": "assets/svg/favorite.svg",
      "name": "Favorite"
    },
    {
      "icon": "assets/svg/settings_outlined.svg",
      "icon_active": "assets/svg/settings.svg",
      "name": "Settings"
    },
    {
      "icon": "assets/svg/profile_outlined.svg",
      "icon_active": "assets/svg/profile.svg",
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
    for (int i = 0; i < popularHouse.length; i++) {
      isItemAnimated.add(false);
    }
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
    popularHouse = List.from(houseList.take(3).toList());
    update();
  }

  void selectTab(int index) {
    oldSelectedTab.value = selectedTab.value;
    selectedTab.value = index;
    update();
  }
}
