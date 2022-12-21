import 'package:flutter/material.dart';

class CustomColors {
  static const Color colorPrimaryLight = Color(0xFFB39AD4);
  static const Color colorPrimary = Color(0xFF000000);
  static const Color colorAccent = Color(0xFFF2BD52);

  static const Color blue = Color(0xFF406BA6);


  static const Color red = Color(0xFFDC3530);
  static const Color green = Color(0xFF1EC469);
  static const Color lightRed = Color(0xFFF7F5F4);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color customGray = Color(0xFFF3F3F3);

  static const Color gray1 = Color(0xFFFAFAFA);
  static const Color gray2 = Color(0xFFF5F5F5);
  static const Color gray3 = Color(0xFFEEEEEE);
  static const Color gray4 = Color(0xFFE0E0E0);
  static const Color gray5 = Color(0xFFBDBDBD);
  static const Color gray6 = Color(0xFF9E9E9E);
  static const Color gray7 = Color(0xFF757575);
  static const Color gray8 = Color(0xFF616161);
  static const Color gray9 = Color(0xFF424242);
  static const Color gray10 = Color(0xFF212121);

  static const Color trans = Color(0x00000000);

  static final Map<int, Color> _map = {
    50: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .1),
    100: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .2),
    200: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .3),
    300: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .4),
    400: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .5),
    500: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .6),
    600: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .7),
    700: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .8),
    800: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, .9),
    900: Color.fromRGBO(
        colorPrimary.red, colorPrimary.green, colorPrimary.blue, 1),
  };

  static MaterialColor primarySwatch = MaterialColor(colorPrimary.value, _map);
}
