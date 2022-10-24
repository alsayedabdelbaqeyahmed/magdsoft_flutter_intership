// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_bloc.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/shared_widget/primary_buttons.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/user/help/animated_container.dart';

import 'package:maged_soft_test/User_Module/Presentation/styles/colors.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/fonts.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/strings.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        listener: (context, state) {},
        builder: (ctx, state) {
          final blocState = UserBloc.get(ctx).helpList;
          return LayoutBuilder(builder: (context, size) {
            return Scaffold(
              body: Container(
                height: size.maxHeight,
                width: size.maxWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.primaryColor.withOpacity(.85),
                      AppColor.primaryColor.withOpacity(0),
                    ],
                    stops: const [0.05, 0.35],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: size.maxHeight * 0.0697,
                              bottom: size.maxHeight * 0.0697,
                            ),
                            child: Text(
                              AppStrings.help,
                              style: AppFontStyle.textStyle(
                                color: AppColor.white,
                                size: size.maxWidth * 0.06976,
                              ),
                            ),
                          ),
                          SizedBox(height: size.maxHeight * 0.0289),
                          AnimatedContainerWidget(
                            size: size,
                            title: 'Account',
                            content:
                                'You need to create an account to use the application but you can delete your account any time you want',
                          ),
                          SizedBox(height: size.maxHeight * 0.0289),
                          AnimatedContainerWidget(
                            size: size,
                            title: 'Data',
                            content:
                                'You need to create an account to use the application but you can delete your account any time you want',
                          ),
                          SizedBox(height: size.maxHeight * 0.0289),
                          AnimatedContainerWidget(
                            size: size,
                            title: 'Fees',
                            content:
                                'You need to create an account to use the application but you can delete your account any time you want',
                          ),
                          SizedBox(height: size.maxHeight * 0.0289),
                          AnimatedContainerWidget(
                            size: size,
                            title: 'Content',
                            content:
                                'You need to create an account to use the application but you can delete your account any time you want',
                          ),
                          SizedBox(height: size.maxHeight * 0.0289),
                          AnimatedContainerWidget(
                            size: size,
                            title: 'Service',
                            content:
                                'You need to create an account to use the application but you can delete your account any time you want',
                          ),
                        ],
                      ),
                      SizedBox(height: size.maxHeight * 0.1609),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            bottom: size.maxHeight * 0.0257),
                        child: PrimaryButton(
                          text: AppStrings.cont,
                          constrain: size,
                          press: () {},
                          isLogin: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
