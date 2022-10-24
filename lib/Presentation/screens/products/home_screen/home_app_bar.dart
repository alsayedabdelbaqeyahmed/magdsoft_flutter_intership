import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:maged_soft_test/Presentation/styles/assets.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/fonts.dart';

class HomeAppBar extends StatelessWidget {
  final BoxConstraints? size;
  const HomeAppBar({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: size!.maxHeight * 0.0536,
          bottom: size!.maxHeight * 0.0236,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size!.maxHeight * 0.0536,
              width: size!.maxWidth * 0.75,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Search',
                  contentPadding: EdgeInsetsDirectional.only(
                    start: size!.maxWidth * 0.025,
                  ),
                  labelStyle: AppFontStyle.textStyle(
                    color: AppColor.iconColor,
                    size: size!.maxWidth * 0.0393,
                  ),
                  suffixIcon:
                      const Icon(Icons.search, color: AppColor.iconColor),
                ),
                onSaved: (newValue) {},
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.zero,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(2, 5),
                  ),
                ],
              ),
              width: size!.maxWidth * 0.1157,
              height: size!.maxWidth * 0.1175,
              child: Image(
                image: const Svg(
                  AppAssets.lable,
                ),
                width: size!.maxWidth * 0.0416,
                height: size!.maxWidth * 0.01716,
              ),
            )
          ],
        ),
      ),
    );
  }
}
