import 'package:flutter/material.dart';
import 'package:homebhase/themes/app_font.dart';

import '../../themes/app_color.dart';

class DetailHouseContent extends StatelessWidget {
  const DetailHouseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
                5,
                (index) => const Icon(
                      Icons.star_rounded,
                      color: amber,
                      size: 24,
                    )),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "123 Junilun Zahra",
                style: text20,
              ),
              const Icon(Icons.favorite_outline_rounded)
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text("Description",
              style: text14.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
