import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:google_fonts/google_fonts.dart';

// TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
//   return TextStyle(
//       fontSize: fontSize,
//       fontFamily: FontConstants.fontFamily,
//       color: color,
//       fontWeight: fontWeight);
// }
//
// // regular style
//
// TextStyle getLightStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.light, color);
// }
//
// // regular style
//
// TextStyle getRegularStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.regular, color);
// }
//
// // medium style
//
// TextStyle getMediumStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.medium, color);
// }
//
// // bold style
//
// TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.bold, color);
// }
//
// // semibold style
//
// TextStyle getSemiBoldStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.semiBold, color );
// }
//
// TextStyle getTextWithLine() {
//   return const TextStyle(
//     color: ColorsManager.white,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//     decoration: TextDecoration.lineThrough,
//     decorationColor: ColorsManager.white,
//   );
// }

class AppStyles {
  static final TextStyle elevatedButton = GoogleFonts.roboto(
      fontSize: 20.sp,color: ColorsManager.black,fontWeight: FontWeight.w400
  );

  static final TextStyle mainStyle = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 24.sp,color: ColorsManager.white,fontWeight: FontWeight.w700
  );

  static final TextStyle profileName = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 20.sp,color: ColorsManager.white,fontWeight: FontWeight.w700
  );

  static final TextStyle year = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 20.sp,color: ColorsManager.lightGrey,fontWeight: FontWeight.w700
  );

  static final TextStyle categoryName = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 20.sp,color: ColorsManager.white,fontWeight: FontWeight.w700
  );

  static final TextStyle description = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 16.sp,color: ColorsManager.white,fontWeight: FontWeight.w400
  );

  static final TextStyle castName = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 20.sp,color: ColorsManager.white,fontWeight: FontWeight.w400
  );

  static final TextStyle hintText = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 16.sp,color: ColorsManager.white,fontWeight: FontWeight.w400
  );

  static final TextStyle suggestion = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 14.sp,color: ColorsManager.yellow,fontWeight: FontWeight.w400
  );

  static final TextStyle appBar = GoogleFonts.roboto(
      decoration: TextDecoration.none,
      fontSize: 18.sp,color: ColorsManager.yellow,fontWeight: FontWeight.w400
  );


}

