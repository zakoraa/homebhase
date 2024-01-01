import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:homebhase/controllers/home_controller.dart";
import "package:homebhase/themes/app_color.dart";

import "../models/house.dart";

class DetailHouseController extends GetxController {
  final homeController = Get.find<HomeController>();
  late final ScrollController scrollController;
  late final House selectedHouse;
  late final Map<String, dynamic> args;
  final RxDouble previewImageHeight = 350.0.obs;
  RxBool appBarHasColor = false.obs;
  RxBool isFullText = false.obs;
  RxBool isLiked = false.obs;
  RxInt selectedIPreviewImage = 0.obs;
  Map<String, List<dynamic>> stars = {};
  List<bool> isItemAnimated = [];
  List<bool> isStarAnimated = [];

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > previewImageHeight.value - 100) {
        appBarHasColor.value = true;
      } else {
        appBarHasColor.value = false;
      }
      update();
    });
    _selectArgument();
    _handleRatingStar();
    _ratingStarAnimation();
    _startAnimation();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _selectArgument() {
    args = Get.arguments;
    selectedHouse = args["house"];
  }

  Future<void> _startAnimation() async {
    for (int i = 0; i < 3; i++) {
      isItemAnimated.add(false);
    }
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(milliseconds: i == 0 ? 0 : 800));
      isItemAnimated[i] = true;
      update();
    }
  }

  Future<void> _ratingStarAnimation() async {
    for (int i = 0; i < 5; i++) {
      isStarAnimated.add(false);
    }
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(milliseconds: i == 0 ? 0 : 400));
      isStarAnimated[i] = true;
      update();
    }
  }

  String getDescriptionSnippet() {
    if (isFullText.value) {
      return selectedHouse.description;
    } else {
      if (selectedHouse.description.length > 250) {
        return "${selectedHouse.description.substring(0, 250)}...";
      }
    }
    update();
    return selectedHouse.description;
  }

  void _handleRatingStar() {
    int rating = selectedHouse.rating >= 4.5 && selectedHouse.rating < 5.0
        ? 4
        : selectedHouse.rating.round();
    for (int i = 0; i < rating; i++) {
      stars.addAll({
        "$i": [Icons.star_rounded, amber]
      });
    }
    if (rating < 5) {
      for (int i = 0; i < 5 - rating; i++) {
        stars.addAll({
          "$i none": [Icons.star_rounded, const Color(0xFFFAD69C)]
        });
      }
    }
    update();
  }
}
