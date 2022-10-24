// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maged_soft_test/User_Module/Data/repository/user_repo.dart';

import 'package:maged_soft_test/User_Module/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/User_Module/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/bloc_observer.dart';
import 'package:maged_soft_test/User_Module/Presentation/controller/user_bloc.dart';
import 'package:maged_soft_test/User_Module/Presentation/router/app_router.dart';

import 'package:maged_soft_test/User_Module/Presentation/screens/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      RemoteDataDioHelper.init();
      final remote = RemoteDataDioHelper();
      print(VerifyUserRepo().hashCode);

      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          /// i do not know how the user will pass to get help page
          /// i decided to call the api when the user lunch the app so
          /// i can get the data an show it at the app
          /// as i missed the button to help page at design

          create: (BuildContext ctx) => UserBloc()..getHelpResponce(context),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
