import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../bar/bottom_bar/tab/index.dart';
import 'package:nature_things/compnents/components/scaffold/tabview/index.dart';
import 'dart:developer' as developer;

class TabviewBloc extends HydratedBloc<TabviewEvent, TabviewState> {
  TabBloc tabBloc;
  // final PageViewBloc pageViewBloc;

  
  dispose(){
    super.close();
  }

  TabviewState get initialState => super.initialState ?? UnTabviewState(0);

  @override
  Stream<TabviewState> mapEventToState(
    TabviewEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'TabviewBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  TabviewState fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic> toJson(TabviewState state) {
    return null;
  }
}