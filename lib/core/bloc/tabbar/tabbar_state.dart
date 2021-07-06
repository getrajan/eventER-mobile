part of 'tabbar_cubit.dart';

class TabbarState {
  const TabbarState(this.index);
  final int index;

  TabbarState copyWith({
    int? index,
  }) {
    return TabbarState(
      index ?? this.index,
    );
  }
}
