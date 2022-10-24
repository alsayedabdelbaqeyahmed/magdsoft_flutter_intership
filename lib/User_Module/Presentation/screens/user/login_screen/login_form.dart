// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_bloc.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_state.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/shared_widget/primary_buttons.dart';

import 'package:maged_soft_test/User_Module/Presentation/styles/strings.dart';

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
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: AppStrings.enterEmail,
                    contentPadding: EdgeInsetsDirectional.only(
                      start: constrain!.maxWidth * 0.025,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onSaved: (newValue) {
                    name = newValue;
                  },
                ),
                SizedBox(height: constrain!.maxHeight * 0.018),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: AppStrings.enterPhone,
                    contentPadding: EdgeInsetsDirectional.only(
                      start: constrain!.maxWidth * 0.025,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onSaved: (newValue) {
                    phone = newValue;
                  },
                ),
                SizedBox(height: constrain!.maxHeight * 0.0343),
                PrimaryButton(
                  text: AppStrings.login,
                  constrain: constrain,
                  press: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      blocState.authWithPhone(
                        User(
                          userName: name,
                          phoneNumber: phone,
                        ),
                      );
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
