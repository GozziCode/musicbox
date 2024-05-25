// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.HOME;
   static const playing = _Paths.PLAYING;
  //  static const theme = _Paths.THEME;
}

abstract class _Paths {
  static const HOME = '/home';
   static const PLAYING = '/playing';
  //  static const THEME = '/theme';
}
