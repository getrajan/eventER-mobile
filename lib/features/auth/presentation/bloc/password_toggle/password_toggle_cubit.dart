import 'package:bloc/bloc.dart';

part 'password_toggle_state.dart';

class PasswordToggleCubit extends Cubit<PasswordToggleState> {
  PasswordToggleCubit() : super(PasswordToggleState(false));

  void togglePassword(isVisible) => emit(state.copyWith(isVisible: !isVisible));
}
