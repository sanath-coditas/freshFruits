import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';

abstract class ButtonStyles {
  static ButtonStyle appButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(0),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(48.0),
    )),
  );
  static ButtonStyle appButtonStyleWithColorBlack = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(0),
    backgroundColor:
        MaterialStateProperty.all<Color>(ColorConstants.blackColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(48.0),
    )),
  );
  static ButtonStyle favButtonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(0xFF12B76A),
      ),
      minimumSize: MaterialStateProperty.all(const Size(93, 60)));
  static ButtonStyle addToCartButtonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorConstants.appTheme,
      ),
      minimumSize: MaterialStateProperty.all(const Size(206, 60)));

  static ButtonStyle nextButtonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorConstants.appTheme,
      ),
      minimumSize: MaterialStateProperty.all(const Size(319, 60)));    
}
