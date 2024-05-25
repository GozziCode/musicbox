import 'package:flutter/material.dart';
import 'package:musicbox/app/core/values/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final lightTheme =
      ThemeData(colorScheme: const ColorScheme.light()).copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: AppBarTheme(
            toolbarHeight: 100,
            color: Colors.grey[300],
            elevation: 0,
            centerTitle: true,
          ));

  static final dark = ThemeData(colorScheme: const ColorScheme.dark()).copyWith(
      scaffoldBackgroundColor: bgColor,
      appBarTheme: const AppBarTheme(
        color: bgColor,
        toolbarHeight: 80,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
      primaryColor: primaryColor,
      canvasColor: bgColor,
      primaryColorDark: Colors.blueGrey,
      textTheme: GoogleFonts.poppinsTextTheme()
          .apply(
            bodyColor: Colors.white,
          )
          .copyWith(
              bodyLarge: const TextStyle(color: bodyTextColor),
              bodyMedium: const TextStyle(color: bodyTextColor)),
      colorScheme: const ColorScheme.dark(background: bgColor));
}
