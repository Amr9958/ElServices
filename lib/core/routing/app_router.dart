import 'package:Elservices/core/Network/repository/Repository.dart';
import 'package:Elservices/core/Network/services/allServices.dart';
import 'package:Elservices/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/cubit/allServicescubit.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/mainpage/cubit/bottom_nav_cubit_cubit.dart';
import '../../features/mainpage/presentation/view/main_view.dart';
import '../../features/onboarding/presentation/view/OnbordingPage.dart';
import '../../features/onboarding/presentation/view/widget/selectLanguage.dart';

String curRoute = '';

class Approuter {
  late Repository _repository;
  late Allservicescubit _allservicescubit;
  Approuter() {
    _repository = Repository(allservices: Allservices());
    _allservicescubit = Allservicescubit(_repository);
  }
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
          builder: (_) => BlocProvider<Allservicescubit>.value(
            value: _allservicescubit,
            child: homePage(),
          ),
        );
      case Routes.Mainpage:
        curRoute = Routes.Mainpage;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => BottomNavCubit(),
            child: Mainpage(),
          ),
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
