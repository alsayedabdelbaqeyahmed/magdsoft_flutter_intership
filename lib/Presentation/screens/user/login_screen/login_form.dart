// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/Domain/entities/user.dart';

import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_state.dart';

import 'package:maged_soft_test/Presentation/screens/shared_widget/primary_buttons.dart';
import 'package:maged_soft_test/Presentation/styles/colors.dart';

import 'package:maged_soft_test/Presentation/styles/strings.dart';

class LoginForm extends StatelessWidget {
  final BoxConstraints? constrain;
  LoginForm({Key? key, this.constrain}) : super(key: key);

  final _key = GlobalKey<FormState>();
  String? name;
  String? phone;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          final blocState = UserBloc.get(ctx);
          return Form(
            key: _key,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
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
                      labelText: AppStrings.enterEmail,
                      contentPadding: EdgeInsetsDirectional.only(
                        start: constrain!.maxWidth * 0.025,
                      ),
                    ),
                    onSaved: (newValue) {
                      name = newValue;
                    },
                  ),
                ),
                SizedBox(height: constrain!.maxHeight * 0.018),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
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
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppStrings.enterPhone,
                      contentPadding: EdgeInsetsDirectional.only(
                        start: constrain!.maxWidth * 0.025,
                      ),
                    ),
                    onSaved: (newValue) {
                      phone = newValue;
                    },
                  ),
                ),
                SizedBox(height: constrain!.maxHeight * 0.0343),
                PrimaryButton(
                  text: AppStrings.login,
                  constrain: constrain,
                  press: () async {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      blocState.authWithPhone(
                          User(
                            userName: name,
                            phoneNumber: phone,
                          ),
                          context);
                    }
                  },
                  isLogin: true,
                ),
              ],
            ),
          );
        });
  }
}
