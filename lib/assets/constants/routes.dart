import 'package:flutter/material.dart';

import '../../core/pages/splash_page.dart';
import '../../features/authentication/presentation/login_screen.dart';
import '../../features/main/presentation/main_screen.dart';


class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case "/home":
        return MaterialPageRoute(
            builder: (context) => const MainScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
