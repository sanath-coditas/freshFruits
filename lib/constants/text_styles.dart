import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle plainTextStyle = GoogleFonts.inter();
  static TextStyle mainHeadingStyle =
      GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.bold);

  static TextStyle subHeadingStyle =
      GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle randomTextStyle =
      GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400);

  static TextStyle createAccountTextStyle = GoogleFonts.inter(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle loginTextStyle =
      GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle termsAndConditionsStyle = GoogleFonts.inter(fontSize: 18);
  static TextStyle createAnAccountStyle =
      GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle congoTextStyle = GoogleFonts.inter(
      color: ColorConstants.orangeColor,
      fontSize: 30,
      fontWeight: FontWeight.bold);
  static TextStyle forgotPasswordTextStyle = GoogleFonts.poppins(
      color: ColorConstants.orangeColor,
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static TextStyle nameTextStyle = GoogleFonts.inter(
      color: ColorConstants.purpleColor,
      fontSize: 15,
      fontWeight: FontWeight.w700);
  static TextStyle priceTextStyle = GoogleFonts.inter(
      color: ColorConstants.lightYellowColor,
      fontSize: 30,
      fontWeight: FontWeight.bold);
  static TextStyle fruitsCategoryTextStyle = GoogleFonts.inter(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: ColorConstants.whiteColor);
  static TextStyle tabBarTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle reviewsTextStyle =
      GoogleFonts.inter(fontSize: 14, color: ColorConstants.greyCOlor);
  static TextStyle tabLabelsStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorConstants.whiteColor);
  static TextStyle placeOrderStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorConstants.orangeColor,
  );
  static TextStyle fruitsStyle =
      GoogleFonts.inter(fontSize: 16, color: ColorConstants.greyCOlor);

  static TextStyle cartpriceTextStyle = GoogleFonts.inter(
      color: ColorConstants.orangeColor,
      fontSize: 27,
      fontWeight: FontWeight.w500);

  static TextStyle itemPriceSTyle =
      GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle shippingAddress = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle shippingAddresswithOrangeColor = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorConstants.orangeColor,
  );
  static TextStyle paymentMethodStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorConstants.lightGreyColor);
  static TextStyle formItemStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle formItemStyleWithOrange = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorConstants.orangeColor,
  );
  static TextStyle formItemStyleWithWhite = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorConstants.whiteColor,
  );

  static TextStyle poppinsW600S20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static TextStyle poppinsW400S14 =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14);
  static TextStyle poppinsW600S50 =
      GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 50);

  static TextStyle poppinsW500S14 =
      GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14);
}
