import 'package:bloc/bloc.dart';

part 'select_one_state.dart';

class SelectOneCubit extends Cubit<SelectOneState> {
  SelectOneCubit()
      : super(SelectOneState(currentCategoryIndex: 0, currentTypeIndex: 0));

  void changeCategory(index, category) =>
      emit(state.copyWith(currentCategoryIndex: index, category: category));
  void changeType(index, type) =>
      emit(state.copyWith(currentTypeIndex: index, type: type));
}
