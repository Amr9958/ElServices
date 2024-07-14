import 'package:Elservices/core/helpers/colors.dart';
import 'package:Elservices/features/SharedWidgets/customAppbar.dart';
import 'package:Elservices/features/SharedWidgets/mytext.dart';
import 'package:Elservices/features/home/presentation/view/widget/blocs.dart';
import 'package:Elservices/features/mainpage/cubit/bottom_nav_cubit_cubit.dart';
import 'package:Elservices/features/mainpage/cubit/bottom_nav_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../onboarding/presentation/view/OnbordingPage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _GridViewblocState();
}

class _GridViewblocState extends State<Mainpage> {
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    HomePageNavigatorKey,
    OnboargingScreenNavigatorKey,
    HomePageNavigatorKey,
    HomePageNavigatorKey,
  ];
  List<Widget> navBarScreens = [
    homePage(),
    OnboargingScreen(),
    homePage(),
    homePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return NavigationBar(
            indicatorShape: const StadiumBorder(),
            animationDuration: const Duration(milliseconds: 1200),
            onDestinationSelected: (int index) {
              context.read<BottomNavCubit>().changeNavBar(index);
            },
            selectedIndex: context.read<BottomNavCubit>().currentIndex,
            destinations: const [
              NavigationDestination(
                selectedIcon: Card(
                  elevation: 4,
                  child: Icon(
                    size: 40,
                    Icons.apps,
                  ),
                ),
                icon: Icon(
                  Icons.apps,
                ),
                label: 'home',
              ),
              NavigationDestination(
                selectedIcon: Card(
                  elevation: 4,
                  child: Icon(
                    size: 40,
                    Icons.person,
                  ),
                ),
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
              NavigationDestination(
                selectedIcon: Card(
                  elevation: 4,
                  child: Icon(
                    size: 40,
                    Icons.settings,
                  ),
                ),
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
              NavigationDestination(
                selectedIcon: Card(
                  elevation: 4,
                  child: Icon(
                    size: 40,
                    Icons.auto_fix_normal,
                  ),
                ),
                icon: Icon(
                  Icons.auto_fix_normal,
                ),
                label: 'About Us',
              ),
            ],
          );
        },
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<BottomNavCubit, BottomNavState>(
          builder: (context, state) {
            if (state is NavBarState) {
              return IndexedStack(index: state.index, children: navBarScreens);
            } else {
              return IndexedStack(index: 0, children: navBarScreens);
            }
          },
        ),
      ),
    );
  }
}
