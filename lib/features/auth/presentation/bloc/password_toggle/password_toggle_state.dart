part of 'password_toggle_cubit.dart';

class PasswordToggleState {
  final bool isVisible;
  const PasswordToggleState(this.isVisible);

  PasswordToggleState copyWith({
    bool? isVisible,
  }) {
    return PasswordToggleState(
      isVisible ?? this.isVisible,
    );
  }
}
