import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("observe event: $event");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    print("observe error: $error");
    super.onError(bloc, error, stacktrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("observe change: $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("observe transition: $transition");
  }
}
