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
import 'package:maged_soft_test/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/Presentation/controller/user_event.dart';
import 'package:maged_soft_test/Presentation/controller/user_state.dart';
import 'package:maged_soft_test/Presentation/router/router_constants.dart';
import 'package:maged_soft_test/Presentation/screens/shared_widget/animated_apge.dart';
import 'package:maged_soft_test/Presentation/screens/user/login_screen/login_screen.dart';
import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/strings.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  static UserBloc get(context) => BlocProvider.of(context);
  late List<dynamic>? helpList;

  Future<bool?> blocShowToast(
      {required String? messege,
      required String? routerName,
      required BuildContext? context}) async {
    return await Fluttertoast.showToast(
      msg: messege!, // message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.TOP, // location
      timeInSecForIosWeb: 2,
      backgroundColor: AppColor.white,
      textColor: AppColor.primaryColor,
    ).whenComplete(
      () => Navigator.pushNamed(
        context!,
        routerName!,
      ),
    );
  }

  void splashScreenTimer(BuildContext context) {
    Timer(
      const Duration(microseconds: 400),
      () => Navigator.of(context).pushReplacement(
        AnimatedPageRoute(
          widget: const LoginScreen(),
          beginDx: 10,
          beginDy: 0,
          endDx: 0,
          endDy: 0,
          curve: Curves.easeIn,
          duration: const Duration(seconds: 3),
        ),
      ),
    );
    emit(UserState());
  }

  void authWithPhone(User userInfo, BuildContext context) async {
    final result = await PostPhoneNumberAndUserName()
        .useCaseSendPhoneAndUserName(userInfo: userInfo);
    // print('phone is $phone');

    result.fold(
      (l) {
        blocShowToast(
          messege: l.errorMessege,
          routerName: AppRouteStrings.help,
          context: context,
        );
        emit(UserState());
      },
      (r) async {
        await CacheHelper.saveDataSharedPreference(
          key: AppConstants.userLocalDataBaseKey,
          value: userInfo.phoneNumber,
        );
        await CacheHelper.saveDataSharedPreference(
          key: AppConstants.authLocalDataBaseKey,
          value: true,
        );
        await blocShowToast(
          messege: r.messege,
          routerName: AppRouteStrings.otp,
          context: context,
        );

        emit(UserState());
      },
    );
    emit(UserState());
  }

  void getOtpResponce(User userInfo, BuildContext context) async {
    final result =
        await GetOtpCodeResponce().useCaseGetOtpResponce(otpResponce: userInfo);

    result.fold(
      (l) {
        blocShowToast(
          messege: l.errorMessege,
          routerName: AppRouteStrings.help,
          context: context,
        );
        emit(UserState());
      },
      (r) {
        blocShowToast(
          messege: r.messege,
          routerName: AppRouteStrings.help,
          context: context,
        );
        emit(UserState());
      },
    );
  }

  void getHelpResponce(BuildContext context) async {
    final result = await GetHelp().useCaseGetHelp();
    result.fold(
      (l) {
        blocShowToast(
          messege: l.errorMessege,
          routerName: AppRouteStrings.products,
          context: context,
        );
        emit(UserState());
      },
      (r) {
        blocShowToast(
          messege: r.message,
          routerName: AppRouteStrings.help,
          context: context,
        ).then((value) {
          helpList = r.help;
        });
        emit(UserState());
      },
    );
  }
}
