import 'package:flutter/material.dart';

class HouseImage extends StatelessWidget {
  final String image;
  const HouseImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        "assets/images/blur.png",
        fit: BoxFit.cover,
      ),
      FadeInImage.assetNetwork(
        placeholder: "assets/images/blur.png",
        image: image,
        fit: BoxFit.cover,
        placeholderScale: 0.5,
        imageErrorBuilder: (context, error, stackTrace) {
          return const Text("Failed to load image");
        },
        placeholderErrorBuilder: (context, error, stackTrace) {
          return const Text("Failed to load image");
        },
      ),
    ]);
  }
}
