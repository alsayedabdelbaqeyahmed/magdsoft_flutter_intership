// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/Data/resources/local_data_source/cache_helper.dart';

import 'package:maged_soft_test/Domain/entities/user.dart';

import 'package:maged_soft_test/Domain/useCase/get_help.dart';
import 'package:maged_soft_test/Domain/useCase/get_otp_code.dart';
import 'package:maged_soft_test/Domain/useCase/get_product_use_case.dart';
import 'package:maged_soft_test/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_event.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_state.dart';
import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_event.dart';
import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_state.dart';

import 'package:maged_soft_test/Presentation/router/router_constants.dart';
import 'package:maged_soft_test/Presentation/screens/products/home_screen/home_screen.dart';
import 'package:maged_soft_test/Presentation/screens/shared_widget/animated_apge.dart';
import 'package:maged_soft_test/Presentation/screens/user/login_screen/login_screen.dart';
import 'package:maged_soft_test/Presentation/styles/colors.dart';

class ProductsBloc extends Bloc<GetProductsEvents, GetProductsState> {
  ProductsBloc() : super(GetProductsState());

  static ProductsBloc get(context) => BlocProvider.of(context);
  List<dynamic>? products;
  List<Widget> screens = const [
    HomeScreen(),
    Scaffold(
      body: Center(
        child: Text('Favourtite'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('notification'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('settings'),
      ),
    )
  ];
  List<>

  int? currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(GetProductsState());
  }

  void getProductsResponce(BuildContext context) async {
    final result = await UseCaseGetProduct().useCaseGetProducts();
    result.fold(
      (l) {
        print(l.errorMessege);
        emit(GetProductsState());
      },
      (r) {
        products = r.products;
        print('products is $products');
        emit(GetProductsState());
      },
    );
  }
}
