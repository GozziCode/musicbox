import 'package:flutter/material.dart';

import '../../../core/theme/theme_controller.dart';



class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:() {
        
      }
    );
  }
}

