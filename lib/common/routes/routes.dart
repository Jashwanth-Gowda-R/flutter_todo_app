import 'package:advanced_flutter_todo_app/features/auth/pages/login_page.dart';
import 'package:advanced_flutter_todo_app/features/auth/pages/otp_page.dart';
import 'package:advanced_flutter_todo_app/features/onboarding/pages/onboarding.dart';
import 'package:advanced_flutter_todo_app/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String home = '/home';

  static Route<MaterialPageRoute> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(
          builder: ((context) {
            return const OnBoarding();
          }),
        );
      case login:
        return MaterialPageRoute(
          builder: ((context) {
            return const LoginPage();
          }),
        );
      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: ((context) {
            return OtpPage(
              smsCodeId: args['smsCodeId'],
              phone: args['phone'],
            );
          }),
        );
      case home:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) {
            return const HomePage();
          }),
        );
    }
  }
}
