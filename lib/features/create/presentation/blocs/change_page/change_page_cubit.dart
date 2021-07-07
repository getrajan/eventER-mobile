import 'package:bloc/bloc.dart';

part 'change_page_state.dart';

class ChangePageCubit extends Cubit<ChangePageState> {
  ChangePageCubit() : super(ChangePageState(currentIndex: 0));

  void onNext(index) {
    emit(state.copyWith(currentIndex: index + 1));
  }

  void onPrevious(index) => emit(state.copyWith(currentIndex: index - 1));
}
