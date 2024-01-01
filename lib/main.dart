import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebhase/views/first.dart';

import 'routes/route.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const ScrollBehavior()
              .copyWith(physics: const BouncingScrollPhysics()),
          child: child!,
        );
      },
      theme: AppTheme.lightTheme,
      getPages: AppPage.pages,
      home: const FirstView(),
    );
  }
}
