// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:maged_soft_test/User_Module/Presentation/styles/colors.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/user/verify_screen/verify_form.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, size) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          height: size.maxHeight,
          width: size.maxWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.primaryColor.withOpacity(.85),
                AppColor.primaryColor.withOpacity(0),
              ],
              stops: [0.05, 0.35],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: size.maxHeight * 0.0665),
                Text(
                  'Verify Phone',
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: size.maxWidth * 0.0697,
                  ),
                ),
                SizedBox(height: size.maxHeight * 0.14806),
                VerifyForm(size: size),
              ],
            ),
          ),
        ),
      );
    });
  }
}
