import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailHouseController extends GetxController {
  late final ScrollController scrollController;
  RxBool appBarHasColor = false.obs;

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
}
