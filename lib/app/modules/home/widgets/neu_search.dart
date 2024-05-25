import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/theme_controller.dart';
import '../../../core/values/colors.dart';

class NeuSearchBox extends StatelessWidget {
  final Widget child;
  NeuSearchBox({super.key, required this.child});
  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.all(15),
        child: Obx(
          () => Container(
              // padding: const EdgeInsets.all(20),
              decoration: themeController.isdarkmode.value
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: bgColor,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 15,
                          color: lightColor,
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          blurRadius: 15,
                          color: darkshadeColor,
                          offset: Offset(-4, -4),
                          spreadRadius: 1,
                        )
                      ],
                    )
                  :

                  ///Light theme[For controlling inner normorphism dark mode]
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.white,
                            offset: Offset(4, 4),
                            spreadRadius: 1),
                        BoxShadow(
                            blurRadius: 15,
                            color: Color(0xFFBDBDBD),
                            offset: Offset(-4, -4),
                            spreadRadius: 1)
                      ],
                      // gradient: LinearGradient(
                      //   colors: [
                      //     Colors.grey[200]!,
                      //     Colors.grey[400]!,
                      //     Colors.grey[500]!,
                      //     Colors.grey[200]!
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   // stops: const [0, 0.1, 0.3, 1]
                      // ),
                    ),
              child: child),
        ));
  }
}
