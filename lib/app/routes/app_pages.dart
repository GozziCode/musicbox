import 'package:get/get.dart';
import 'package:musicbox/app/core/theme/theme_controller.dart';
import 'package:musicbox/app/modules/playing/controllers/playing_controller.dart';
import 'package:musicbox/app/modules/playing/views/playing_screen.dart';

import '../modules/home/home_controller.dart';
import '../modules/home/views/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<HomeController>(() => HomeController());
          Get.lazyPut<ThemeController>(() => ThemeController());
        },
      ),
    ),
    GetPage(
      name: _Paths.PLAYING,
      page: () => const PlayingScreen(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<PlayingController>(() => PlayingController());
        },
      ),
    )
  ];
}
