// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/Data/resources/local_data_source/cache_helper.dart';
import 'package:maged_soft_test/Domain/entities/user.dart';

import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_state.dart';

import 'package:maged_soft_test/Presentation/screens/shared_widget/primary_buttons.dart';
import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/strings.dart';

class VerifyForm extends StatefulWidget {
  final BoxConstraints? size;
  const VerifyForm({super.key, this.size});

  @override
  State<VerifyForm> createState() => _VerifyFormState();
}

class _VerifyFormState extends State<VerifyForm> {
  final key = GlobalKey<FormState>();
  String? code1;
  String? code2;
  String? code3;
  String? code4;
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          final blocState = UserBloc.get(ctx);
          return Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: widget.size!.maxWidth * 0.109,
                    end: widget.size!.maxWidth * 0.108,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      otpForm(widget.size, (value) => code1 = value),
                      otpForm(widget.size, (value) => code2 = value),
                      otpForm(widget.size, (value) => code3 = value),
                      otpForm(widget.size, (value) => code4 = value),
                    ],
                  ),
                ),
                SizedBox(height: widget.size!.maxHeight * 0.0965),
                PrimaryButton(
                  text: AppStrings.resendCode,
                  press: () {},
                  constrain: widget.size,
                  isResend: true,
                ),
                SizedBox(height: widget.size!.maxHeight * 0.0836),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: widget.size!.maxHeight * 0.0836,
                  ),
                  child: PrimaryButton(
                    text: AppStrings.verify,
                    press: () async {
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                        final phone =
                            await CacheHelper.getDataFromSharedPreference(
                                key: AppConstants.userLocalDataBaseKey);
                        print('phone is $phone');
                        print('code is $code1$code2$code3$code4');
                        blocState.getOtpResponce(
                          User(
                              code: '$code1$code2$code3$code4',
                              phoneNumber: phone,
                              userName: ''),
                          context,
                        );
                      }
                    },
                    constrain: widget.size,
                    isLogin: true,
                    isVerify: true,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget otpForm(BoxConstraints? size, Function(String?)? onSaved) {
    return Container(
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
      width: size!.maxWidth * 0.162,
      height: size.minHeight * 0.0856,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColor.primaryColor,
            ),
          ),
        ),
        style: TextStyle(fontSize: size.maxHeight * 0.04),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onSaved: onSaved,
      ),
    );
  }
}
