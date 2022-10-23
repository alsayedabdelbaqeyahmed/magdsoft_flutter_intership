import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/user/login_screen/login_screen.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/shared_widget/animated_apge.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/assets.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _afterTime() {
    Timer(const Duration(microseconds: 400), _getNext);
  }

  _getNext() {
    Navigator.of(context).pushReplacement(
      AnimatedPageRoute(
        widget: const LoginScreen(),
        beginDx: 10,
        beginDy: 0,
        endDx: 0,
        endDy: 0,
        curve: Curves.easeIn,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _afterTime();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
