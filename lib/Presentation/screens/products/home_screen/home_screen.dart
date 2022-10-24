// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_state.dart';
import 'package:maged_soft_test/Presentation/screens/products/home_screen/home_app_bar.dart';
import 'package:maged_soft_test/Presentation/styles/assets.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/fonts.dart';
import 'package:maged_soft_test/Presentation/styles/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return BlocConsumer<ProductsBloc, GetProductsState>(
          listener: (context, state) {},
          builder: (ctx, state) {
            final blocState = ProductsBloc.get(ctx);
            // print('products is ${blocState.products}');
            return LayoutBuilder(
              builder: (context, constrain) {
                return Container(
                  padding: EdgeInsetsDirectional.only(
                    start: size.maxWidth * 0.0462,
                    end: size.maxWidth * 0.0462,
                  ),
                  height: size.maxHeight,
                  width: size.maxWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.primaryColor.withOpacity(.85),
                        AppColor.primaryColor.withOpacity(0),
                      ],
                      stops: [0.05, 0.5],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HomeAppBar(size: size),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: size.maxWidth * 0.8541,
                              child: Image.asset(
                                AppAssets.homeBack,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              top: size.maxHeight * 0.15128,
                              left: size.maxWidth * 0.0277,
                              child: Text(
                                'New Release',
                                style: AppFontStyle.textStyle(
                                  size: size.maxWidth * 0.02558,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            Positioned(
                              top: size.maxHeight * 0.16523,
                              left: size.maxWidth * 0.0277,
                              child: Text(
                                'Acer Predator Helios 300',
                                style: AppFontStyle.textStyle(
                                  size: size.maxWidth * 0.02558,
                                  color: AppColor.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: size.maxHeight * 0.0150),
                        SizedBox(
                          height: size.maxHeight * 0.0708,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(width: size.maxWidth * 0.0578);
                            },
                            itemCount: blocState.assets!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: EdgeInsetsDirectional.zero,
                                width: size.maxWidth * 0.3,
                                height: size.maxHeight * 0.0557,
                                decoration: BoxDecoration(
                                  color:
                                      blocState.text![index] == AppStrings.all
                                          ? AppColor.primaryColor
                                          : AppColor.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.shadowColor
                                          .withOpacity(0.25),
                                      spreadRadius: 4,
                                      blurRadius: 8,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: size.maxHeight * 0.0364,
                                      height: size.maxHeight * 0.0364,
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Image.asset(
                                        blocState.assets![index],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: size.maxWidth * 0.0395),
                                      child: Text(
                                        blocState.text![index],
                                        style: AppFontStyle.textStyle(
                                          size: size.maxWidth * 0.0509,
                                          color: blocState.text![index] ==
                                                  AppStrings.all
                                              ? AppColor.white
                                              : Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: size.maxHeight * 0.0150),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 190,
                                    child: Text(
                                      'Recomended for You',
                                      style: AppFontStyle.textStyle(
                                          color: Colors.black, size: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.maxHeight,
                                    width: size.maxWidth * 0.5,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      // shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Text(
                                            blocState.products![index]
                                                ['company'],
                                            style: AppFontStyle.textStyle(
                                                color: Colors.black, size: 30),
                                          ),
                                        );
                                      }),
                                      itemCount: blocState.evendId!.length,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  // SizedBox(
                                  //   width: 190,
                                  //   child: Text(
                                  //     'Recomended for You',
                                  //     style: AppFontStyle.textStyle(
                                  //         color: Colors.black, size: 30),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: size.maxHeight,
                                    width: size.maxWidth * 0.5,
                                    child: ListView.builder(
                                      shrinkWrap: true,

                                      // shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Text(
                                            blocState.products![index]
                                                ['company'],
                                            style: AppFontStyle.textStyle(
                                                color: Colors.black, size: 30),
                                          ),
                                        );
                                      }),
                                      itemCount: blocState.evendId!.length,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
