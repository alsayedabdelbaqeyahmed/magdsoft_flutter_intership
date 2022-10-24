// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maged_soft_test/Presentation/screens/user/login_screen/login_form.dart';
import 'package:maged_soft_test/Presentation/styles/assets.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: SizedBox(
            height: constrain.maxHeight,
            width: constrain.maxWidth,
            child: Stack(
              children: [
                SizedBox(
                  child: Image.asset(
                    AppAssets.cityBackground,
                    fit: BoxFit.cover,
                    color: AppColor.primaryColor.withOpacity(0.32),
                    colorBlendMode: BlendMode.color,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: constrain.maxWidth,
                    height: constrain.maxHeight * 0.66,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: constrain.maxHeight * 0.37),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: constrain.maxWidth * 0.065,
                              end: constrain.maxWidth * 0.069,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Container(
                                  width: constrain.maxWidth * 0.383,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: AppColor.lineColor,
                                  ),
                                ),
                                Text(AppStrings.or),
                                Container(
                                  width: constrain.maxWidth * 0.383,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: AppColor.lineColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: constrain.maxHeight * 0.09),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              socislMediaButtons(
                                  assets: AppAssets.googleLogo,
                                  size: constrain,
                                  scale: 1.8),
                              SizedBox(width: constrain.maxWidth * 0.106),
                              socislMediaButtons(
                                  assets: AppAssets.appleLogo, size: constrain),
                              SizedBox(width: constrain.maxWidth * 0.134),
                              socislMediaButtons(
                                  assets: AppAssets.facebookLogo,
                                  size: constrain),
                            ],
                          ),
                          SizedBox(height: constrain.maxHeight * 0.136),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: constrain.maxHeight * 0.2,
                  left: constrain.maxWidth * 0.06,
                  width: constrain.maxWidth * 0.86,
                  height: constrain.maxHeight * 0.37,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: AppColor.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.shadowColor.withOpacity(0.25),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(2, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: constrain.maxHeight * 0.029,
                          start: constrain.maxWidth * .106,
                          end: constrain.maxWidth * .102,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // need to add font family
                          children: [
                            Text(
                              AppStrings.welcome,
                              style: TextStyle(
                                fontSize: constrain.maxWidth * 0.069,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: constrain.maxHeight * 0.016),
                            Container(
                              width: constrain.maxWidth * 0.332,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: AppColor.primaryColor.withOpacity(0.72),
                              ),
                            ),
                            SizedBox(height: constrain.maxHeight * 0.066),
                            LoginForm(constrain: constrain),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget socislMediaButtons(
      {String? assets, BoxConstraints? size, double scale = 1}) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // print('object');
      },
      icon: Container(
        // ignore: sort_child_properties_last
        child: Image.asset(
          assets!,
          width: 38,
          height: 38,
          scale: scale,
        ),
        height: 54,
        width: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(2, 5),
            ),
          ],
        ),
      ),
    );
  }
}
