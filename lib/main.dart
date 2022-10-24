// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:maged_soft_test/Data/repository/user_repo.dart';
import 'package:maged_soft_test/Data/resources/local_data_source/cache_helper.dart';
import 'package:intl/intl.dart';
import 'package:maged_soft_test/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/Domain/useCase/post_phone_user_name.dart';
import 'package:maged_soft_test/Presentation/controller/bloc_observer.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/user_controller.dart/user_bloc.dart';

import 'package:maged_soft_test/Presentation/router/app_router.dart';
import 'package:maged_soft_test/Presentation/screens/products/home_screen/home_screen.dart';
import 'package:maged_soft_test/Presentation/screens/products/home_screen/navigation_bar.dart';
import 'package:maged_soft_test/Presentation/screens/user/login_screen/login_screen.dart';

import 'package:maged_soft_test/Presentation/screens/user/splash/splash.dart';
import 'package:maged_soft_test/Presentation/styles/theme.dart';
import 'package:sizer/sizer.dart';

import 'Presentation/screens/shared_widget/toast.dart';

late LocalizationDelegate delegate;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      RemoteDataDioHelper.init();
      await CacheHelper.init();
      final locale = CacheHelper.getDataFromSharedPreference(key: 'language') ??
          "en"; // the default lang is en
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      runApp(
        MyApp(appRouter: AppRouter()),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString());
      }
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext ctx) => UserBloc(),
          ),
          BlocProvider(
            create: (BuildContext ctx) =>
                ProductsBloc()..getProductsResponce(context),
          ),
        ],
        child: LayoutBuilder(builder: (context, size) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(builder: (context, constraints) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Werash',
                    localizationsDelegates: [
                      GlobalCupertinoLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      delegate,
                    ],
                    locale: delegate.currentLocale,
                    supportedLocales: delegate.supportedLocales,
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    theme: appThemeManger(size),
                    home: const NavigationBarScreen(),
                  );
                }),
              );
            },
          );
        }));
  }
}
