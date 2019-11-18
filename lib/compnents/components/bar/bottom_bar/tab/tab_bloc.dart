import 'dart:async';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nature_things/compnents/components/bar/bottom_bar/tab/index.dart';
import 'dart:developer' as developer;

class TabBloc extends HydratedBloc<TabEvent, TabItem> {

  final List<TabItem> tabs;

  TabBloc(this.tabs);
  
  dispose() => super.close();

  TabItem get initialState => tabs[0];

  @override
  Stream<TabItem> mapEventToState(
    TabEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'TabBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  TabItem fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic> toJson(TabItem state) {
    return null;
  }
}