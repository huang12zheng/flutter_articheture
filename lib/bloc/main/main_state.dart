import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:nature_things/bloc/main/index.dart';

@immutable
abstract class MainState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  
  final Iterable propss;
  MainState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  MainState getStateCopy();

  MainState getNewVersion();

  @override
  List<Object> get props => (propss);
}

/// UnInitialized
class UnMainState extends MainState {

  UnMainState(version) : super(version);

  @override
  String toString() => 'UnMainState';

  @override
  UnMainState getStateCopy() {
    return UnMainState(0);
  }

  @override
  UnMainState getNewVersion() {
    return UnMainState(version+1);
  }
}
/// [LoadMainEvent]
class InMainState extends MainState {
  // final SettingModel setting;
  final List<TabItem> tabs;
  final List<Widget> pages;

  InMainState(version, {this.pages, this.tabs}) : super(version, [pages]);

  @override
  String toString() => 'InMainState $pages';

  @override
  InMainState getStateCopy() {
    return InMainState(this.version, pages: this.pages, tabs: this.tabs);
  }

  @override
  InMainState getNewVersion() {
    return InMainState(version+1, pages: this.pages, tabs: this.tabs);
  }

}

class ErrorMainState extends MainState {
  final String errorMessage;

  ErrorMainState(version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorMainState';

  @override
  ErrorMainState getStateCopy() {
    return ErrorMainState(this.version, this.errorMessage);
  }

  @override
  ErrorMainState getNewVersion() {
    return ErrorMainState(version+1, this.errorMessage);
  }
}
