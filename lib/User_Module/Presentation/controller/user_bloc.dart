// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maged_soft_test/Core/shared/enums.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/get_help.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/get_otp_code.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_event.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_state.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/shared_widget/animated_apge.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/user/login_screen/login_screen.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  static UserBloc get(context) => BlocProvider.of(context);

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
    emit(
      UserState(stateResponce: RequestState.done),
    );
  }

  void authWithPhone(User userInfo) async {
    final result = await PostPhoneNumberAndUserName()
        .useCaseSendPhoneAndUserName(userInfo: userInfo);
    result.fold(
      (l) => print(l.errorMessege),
      (r) => print(r.messege),
    );
    emit(
      UserState(stateResponce: RequestState.done),
    );
  }

  void getOtpResponce(User userInfo) async {
    final result =
        await GetOtpCodeResponce().useCaseGetOtpResponce(otpResponce: userInfo);

    result.fold(
      (l) => print(l.errorMessege),
      (r) => print(r.messege),
    );
  }

  void getHelpResponce(User userInfo) async {
    final result = await GetHelp().useCaseGetHelp();
    result.fold(
      (l) => print(l.errorMessege),
      (r) => print(r.message),
    );
  }
}
