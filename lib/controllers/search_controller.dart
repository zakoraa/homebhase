import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/data/house.dart';
import 'package:homebhase/models/house.dart';

class SearchViewController extends GetxController {
  late final TextEditingController searchText;
  List<House> listSearchResult = [];
  RxBool isEmptyText = true.obs;

  @override
  void onInit() {
    searchText = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchText.dispose();
    super.onClose();
  }

  void _onSearch(String text) {
    listSearchResult = houseList
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
