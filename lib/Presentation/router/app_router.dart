import 'package:flutter/material.dart';
import 'package:maged_soft_test/Presentation/router/router_constants.dart';
import 'package:maged_soft_test/Presentation/screens/user/splash/splash.dart';
import 'package:maged_soft_test/Presentation/screens/user/help/help.dart';
import 'package:maged_soft_test/Presentation/screens/user/login_screen/login_screen.dart';
import 'package:maged_soft_test/Presentation/screens/user/verify_screen/verifiy_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRouteStrings.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRouteStrings.otp:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case AppRouteStrings.help:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      default:
        return null;
    }
  }
}
