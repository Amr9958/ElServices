sealed class BottomNavState {}

final class BottomNavCubitInitial extends BottomNavState {}

final class NavBarState extends BottomNavState {
  final  int index;

  NavBarState({required this.index});

}
