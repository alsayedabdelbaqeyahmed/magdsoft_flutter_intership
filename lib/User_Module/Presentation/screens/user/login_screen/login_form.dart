// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/shared_widget/primary_buttons.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/colors.dart';

class LoginForm extends StatefulWidget {
  final BoxConstraints? constrain;
  const LoginForm({Key? key, this.constrain}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Your Full Name',
              contentPadding: EdgeInsetsDirectional.only(
                  start: widget.constrain!.maxWidth * 0.025),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: widget.constrain!.maxHeight * 0.018),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Your Phone Number',
              contentPadding: EdgeInsetsDirectional.only(
                  start: widget.constrain!.maxWidth * 0.025),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: widget.constrain!.maxHeight * 0.0343),
          PrimaryButton(
            text: 'Login',
            constrain: widget.constrain,
            press: () {},
            isLogin: true,
          ),
        ],
      ),
    );
  }
}
