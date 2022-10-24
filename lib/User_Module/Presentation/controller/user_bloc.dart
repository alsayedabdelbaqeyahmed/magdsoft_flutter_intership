// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';

import 'package:maged_soft_test/User_Module/Domain/useCase/get_help.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/get_otp_code.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_event.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_state.dart';
import 'package:maged_soft_test/User_Module/Presentation/router/router_constants.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/shared_widget/animated_apge.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/user/login_screen/login_screen.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/colors.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  static UserBloc get(context) => BlocProvider.of(context);
  late List<dynamic>? helpList;

  Future<bool?> showToast(
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
    result.fold(
      (l) {
        showToast(
          messege: l.errorMessege,
          routerName: AppRouteStrings.otp,
          context: context,
        );
      },
      (r) {
        showToast(
          messege: r.messege,
          routerName: AppRouteStrings.help,
          context: context,
        );
      },
    );
    emit(UserState());
  }

  void getOtpResponce(User userInfo, BuildContext context) async {
    final result =
        await GetOtpCodeResponce().useCaseGetOtpResponce(otpResponce: userInfo);

    result.fold(
      (l) {
        showToast(
          messege: l.errorMessege,
          routerName: AppRouteStrings.otp,
          context: context,
        );
      },
      (r) {
        showToast(
          messege: r.messege,
          routerName: AppRouteStrings.help,
          context: context,
        );
      },
    );
  }

  void getHelpResponce(BuildContext context) async {
    final result = await GetHelp().useCaseGetHelp();
    result.fold(
      (l) {
        showToast(
          messege: l.errorMessege,
          routerName: AppRouteStrings.products,
          context: context,
        );
      },
      (r) {
        showToast(
          messege: r.message,
          routerName: AppRouteStrings.help,
          context: context,
        ).then((value) {
          helpList = r.help;
        });
      },
    );
  }
}
