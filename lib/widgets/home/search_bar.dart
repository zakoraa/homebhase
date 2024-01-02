import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:homebhase/routes/route_name.dart';

import '../../themes/app_font.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: InkWell(
        onTap: () => Get.toNamed(RouteName.search),
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search Here...",
                style: text14.copyWith(color: Colors.grey),
              ),
              SvgPicture.asset("assets/svg/search.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  semanticsLabel: 'Search')
            ],
          ),
        ),
      ),
    );
  }
}
