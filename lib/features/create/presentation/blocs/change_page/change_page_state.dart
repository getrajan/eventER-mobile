part of 'change_page_cubit.dart';

class ChangePageState {
  const ChangePageState({
    required this.currentIndex,
    this.buttonEnabled = false,
  });

  final int currentIndex;
  final bool buttonEnabled;

  ChangePageState copyWith({
    int? currentIndex,
    bool? buttonEnabled,
  }) {
    return ChangePageState(
      currentIndex: currentIndex ?? this.currentIndex,
      buttonEnabled: buttonEnabled ?? this.buttonEnabled,
    );
  }
}
