
import 'package:Elservices/core/routing/routes.dart';
import 'package:flutter/material.dart';

String curRoute = '';

class Approuter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.selectLanguagePage:
      //   curRoute = Routes.selectLanguagePage;
      //   return MaterialPageRoute(
      //     builder: (_) => chooseLanguages(true),
      //   );
      // case Routes.onboargingScreen:
      //   curRoute = Routes.onboargingScreen;

      //   return MaterialPageRoute(
      //     builder: (_) => onboardingPage(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
