import 'package:get/get.dart';
import 'package:homebhase/controllers/detail_house_controller.dart';

class DetailHouseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHouseController>(() => DetailHouseController(),
        fenix: true);
  }
}
