// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_state.dart';
import 'package:maged_soft_test/Presentation/screens/products/home_screen/home_app_bar.dart';
import 'package:maged_soft_test/Presentation/styles/assets.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';

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
                        ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) => ),
                        ),
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
