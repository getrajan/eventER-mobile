part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class PageTappedEvent extends BottomNavEvent {
  final int index;
  PageTappedEvent(this.index);
}
