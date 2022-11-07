import 'package:flutter/material.dart';

abstract class ColorConstants {
  static const Map<int, Color> color = {
    50: Color.fromRGBO(254, 197, 75, .1),
    100: Color.fromRGBO(254, 197, 75, .2),
    200: Color.fromRGBO(254, 197, 75, .3),
    300: Color.fromRGBO(254, 197, 75, .4),
    400: Color.fromRGBO(254, 197, 75, .5),
    500: Color.fromRGBO(254, 197, 75, .6),
    600: Color.fromRGBO(254, 197, 75, .7),
    700: Color.fromRGBO(254, 197, 75, .8),
    800: Color.fromRGBO(254, 197, 75, .9),
    900: Color.fromRGBO(254, 197, 75, 1),
  };

  static MaterialColor appTheme = const MaterialColor(0xFFFEC54B, color);
  static Color orangeColor = const Color(0xFFE67F1E);
  static Color appBackgroundcolor = const Color(0xFFFBFBFB);
  static Color activeDotColor = const Color(0xFF12B76A);
  static Color inactiveDotColor = const Color(0xFFF2F2F2);
  static Color blackColor = Colors.black;
  static Color whiteColor = Colors.white;
  static Color purpleColor = const Color(0xff7A1E76);
  static Color scaffoldbgColor = const Color(0xFFFAFEFC);
  static Color tileColor = const Color(0xFFFBFBFB);
  static Color bottomNavbarItemColor = const Color(0xFFB1B1B1);
  static Color greyCOlor = Colors.grey;
  static Color counterButtonColor = const Color(0xFFEFEFEF);
  static Color lightYellowColor = const Color(0xFFFEC54B);
  static Color lightGreyColor = const Color(0xFFCBCBCB);
  static Color lightGreyContainerColor = const Color(0xFFF2F2F2);
}
