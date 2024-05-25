import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicbox/app/core/values/colors.dart';

import '../core/theme/theme_controller.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  final double? width, height;
  final VoidCallback? onPress;
  NeuBox({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.onPress,
  }) : super(key: key);

  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(12),
        width: width,
        height: height,
        decoration: themeController.isdarkmode.value
            ?
            //Dark theme
            BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                    BoxShadow(
                        color: darkshadeColor,
                        blurRadius: 15,
                        offset: Offset(4, 4),
                        spreadRadius: 1),
                    BoxShadow(
                        blurRadius: 15,
                        color: lightColor,
                        offset: Offset(-4, -4),
                        spreadRadius: 1)
                  ])
            //light theme
            : BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                    BoxShadow(
                        color: greydarkShade,
                        blurRadius: 15,
                        offset: Offset(5, 5)),
                    BoxShadow(
                      blurRadius: 15,
                      color: white,
                      offset: Offset(-5, -5),
                    ),
                  ]),
        child: Center(child: child),
      ),
    );
  }
}
