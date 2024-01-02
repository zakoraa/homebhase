import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/data/house.dart';
import 'package:homebhase/models/house.dart';

class SearchViewController extends GetxController {
  late final TextEditingController searchText;
  List<House> listSearchResult = [];
  List<House> recommendedHouseList = [];
  List<bool> isItemAnimated = [];
  RxBool isEmptyText = true.obs;
  RxBool isInit = false.obs;

  @override
  Future<void> onInit() async {
    searchText = TextEditingController();
    _selectPopularHouse();
    _startAnimation();
    await Future.delayed(const Duration(milliseconds: 2200));
    isInit.value = true;
    super.onInit();
  }

  @override
  void onClose() {
    searchText.dispose();
    super.onClose();
  }

  Future<void> _startAnimation() async {
    for (int i = 0; i < recommendedHouseList.length; i++) {
      isItemAnimated.add(false);
    }
    for (int i = 0; i < recommendedHouseList.length; i++) {
      await Future.delayed(Duration(milliseconds: i == 0 ? 0 : 600));
      isItemAnimated[i] = true;
      update();
    }
  }

  void _selectPopularHouse() {
    houseList.shuffle();
    recommendedHouseList = houseList.take(3).toList();
    update();
  }

  void onSearch(String text) {
    if (text.isEmpty) {
      listSearchResult = [];
    } else {
      listSearchResult = houseList
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    update();
  }
}
