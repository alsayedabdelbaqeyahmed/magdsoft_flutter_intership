import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/fonts.dart';

ThemeData appThemeManger(BoxConstraints size) {
  return ThemeData(
    fontFamily: AppFontStyle.fontFamily,
    // main color theme
    primaryColor: AppColor.primaryColor,

    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        //statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    //input theme used at textformfield

    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      labelStyle: AppFontStyle.textStyle(
        color: AppColor.hintTextColor,
        size: size.maxHeight * 0.0170,
      ),
    ),
  );
}
