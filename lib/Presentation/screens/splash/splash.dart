import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/user_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/user_event.dart';
import 'package:maged_soft_test/Presentation/controller/user_state.dart';
import 'package:maged_soft_test/Presentation/screens/user/login_screen/login_screen.dart';
import 'package:maged_soft_test/Presentation/screens/shared_widget/animated_apge.dart';
import 'package:maged_soft_test/Presentation/styles/assets.dart';
import 'package:maged_soft_test/Presentation/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        listener: ((context, state) {}),
        builder: (ctx, state) {
          // get data used to call the bloc to get splashscreen timer
          // wich will work every time the splash screen is build
          final getdata = UserBloc.get(ctx);
          getdata.splashScreenTimer(ctx);
          return Scaffold(
            backgroundColor: AppColor.primaryColor,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.splashBack,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(AppAssets.splashLogo),
              ),
            ),
          );
        });
  }
}
