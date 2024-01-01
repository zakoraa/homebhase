import 'package:get/get.dart';
import 'package:homebhase/controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchViewController>(() => SearchViewController());
  }
}
