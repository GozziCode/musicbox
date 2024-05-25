import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/theme_controller.dart';
import '../../../core/values/colors.dart';

class Shadow extends StatelessWidget {
  Shadow({
    Key? key,
  }) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Obx(
          () => Container(
            height: 60,
            decoration: themeController.isdarkmode.value
                ? BoxDecoration(
                    gradient: LinearGradient(
                        colors: [bgColor.withOpacity(0), bgColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  )
                : BoxDecoration(
                    gradient: LinearGradient(
                        colors: [grey.withOpacity(0), grey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
          ),
        ));
  }
}
