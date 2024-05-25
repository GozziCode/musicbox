import 'package:get/get.dart';

import 'theme_controller.dart';

class ThemeControllerBinding implements Bindings{
  @override
  void dependencies() {
Get.lazyPut<ThemeController>(() => ThemeController());  }

}