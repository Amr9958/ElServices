import 'package:Elservices/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/home_view.dart';
import '../../features/onboarding/presentation/view/OnbordingPage.dart';
import '../../features/onboarding/presentation/view/widget/selectLanguage.dart';

String curRoute = '';

class Approuter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SelectLanguagePage:
        curRoute = Routes.SelectLanguagePage;
        return MaterialPageRoute(
          builder: (_) => SelectLanguagePage(),
        );
      case Routes.OnboargingScreen:
        curRoute = Routes.OnboargingScreen;

        return MaterialPageRoute(
          builder: (_) => OnboargingScreen(),
        );
      case Routes.homePage:
        curRoute = Routes.homePage;

        return MaterialPageRoute(
          builder: (_) => homePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
