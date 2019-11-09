import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nature_things/bloc/main/index.dart';
import 'dart:developer' as developer;

class MainBloc extends HydratedBloc<MainEvent, MainState> {
  static final MainBloc _mainBlocSingleton = MainBloc._internal();
  factory MainBloc() {
    return _mainBlocSingleton;
  }
  MainBloc._internal();

  dispose(){
    _mainBlocSingleton.dispose();
  }

  MainState get initialState => super.initialState ?? UnMainState(0);
  

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'MainBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  MainState fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic> toJson(MainState state) {
    return null;
  }
}
