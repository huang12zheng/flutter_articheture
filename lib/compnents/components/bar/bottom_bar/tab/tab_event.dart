import 'dart:async';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:nature_things/compnents/components/bar/bottom_bar/tab/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TabEvent {
  Future<TabItem> applyAsync(
      {TabItem currentState, TabBloc bloc});
}

class UpdateTabEvent extends TabEvent {
  final TabItem tab;

  UpdateTabEvent(this.tab);
   
  @override
  String toString() => 'UpdateTabEvent ${tab.title}';

  @override
  Future<TabItem> applyAsync(
      {TabItem currentState, TabBloc bloc}) async {
      return tab;
  }
}