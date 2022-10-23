// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:maged_soft_test/User_Module/Data/repository/user_repo.dart';
import 'package:maged_soft_test/User_Module/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/help.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/get_help.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/get_otp_code.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/splash/splash.dart';
import 'package:maged_soft_test/User_Module/Presentation/screens/user/help/help.dart';

void main() async {
  RemoteDataDioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HelpScreen(),
    );
  }
}
