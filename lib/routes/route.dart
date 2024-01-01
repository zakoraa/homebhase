import 'package:get/get.dart';
import 'package:homebhase/bindings/detail_house_binding.dart';
import 'package:homebhase/bindings/home_binding.dart';
import 'package:homebhase/bindings/search_binding.dart';
import 'package:homebhase/views/detail_house.dart';
import 'package:homebhase/views/search.dart';

import '../views/first.dart';
import '../views/home.dart';
import 'route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.first,
      page: () => const FirstView(),
    ),
    GetPage(
        name: RouteName.home,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: RouteName.detailHouse,
        page: () => const DetailHouseView(),
        binding: DetailHouseBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: RouteName.search,
        page: () => const SearchView(),
        binding: SearchBinding(),
        transition: Transition.downToUp),
  ];
}
