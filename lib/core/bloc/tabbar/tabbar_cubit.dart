import 'package:bloc/bloc.dart';

part 'tabbar_state.dart';

class TabbarCubit extends Cubit<TabbarState> {
  TabbarCubit() : super(TabbarState(0));

  void changeTabIndex(currentIndex) =>
      emit(state.copyWith(index: currentIndex));
}
