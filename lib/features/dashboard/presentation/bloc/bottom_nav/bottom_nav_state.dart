part of 'bottom_nav_bloc.dart';

abstract class BottomNavState {
  const BottomNavState();
}

class CurrentIndexChangedState extends BottomNavState {
  final int currentIndex;
  CurrentIndexChangedState(this.currentIndex);
}
