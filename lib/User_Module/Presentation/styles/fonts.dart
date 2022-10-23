import 'package:flutter/material.dart';

class AppFontStyle {
  static const String fontFamily = 'Inter';

  static TextStyle textStyle(
      {Color? color,
      FontWeight? fontWeight = FontWeight.w400,
      double? size,
      String? fontFamily = AppFontStyle.fontFamily}) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: size,
      fontFamily: fontFamily,
    );
  }
}
