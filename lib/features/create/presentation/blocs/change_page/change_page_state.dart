part of 'change_page_cubit.dart';

class ChangePageState {
  const ChangePageState({required this.currentIndex});
  final int currentIndex;

  ChangePageState copyWith({
    int? currentIndex,
  }) {
    return ChangePageState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
