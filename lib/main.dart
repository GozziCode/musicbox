import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:musicbox/app/core/theme/theme_controller.dart';
import 'package:musicbox/app/core/theme/theme_controller_binding.dart';
import 'package:musicbox/app/core/theme/themes.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  ThemeControllerBinding().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Box',
      themeMode: themeController.theme,
      darkTheme: Themes.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.lightTheme,
    );
  }
}
