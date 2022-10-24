// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_state.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return BlocConsumer<ProductsBloc, GetProductsState>(
          listener: (context, state) {},
          builder: (ctx, state) {
            final blocState = ProductsBloc.get(ctx);
            print('products is ${blocState.products}');
            return LayoutBuilder(
              builder: (context, constrain) {
                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        ((context, index) {
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
                            child: Column(
                              children: [
                                Row(
                                  children: [],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                );
              },
            );
          });
    });
  }
}
