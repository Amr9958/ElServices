import 'package:Elservices/features/mainpage/cubit/bottom_nav_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavCubitInitial());

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'favorite'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
  ];
  int currentIndex = 0;
  void changeNavBar(index) {
    currentIndex = index;
    emit(NavBarState(index: currentIndex));
  }
}
