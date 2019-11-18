import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:nature_things/bloc/setting/setting_model.dart';
import 'package:nature_things/compnents/components/scaffold/tabview/tabview_scaffold.dart';

@immutable
abstract class TabviewState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final Iterable propss;
  TabviewState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  TabviewState getStateCopy();

  TabviewState getNewVersion();

  @override
  List<Object> get props => (propss);

  Widget build();
}

/// UnInitialized
class UnTabviewState extends TabviewState {

  UnTabviewState(version) : super(version);

  @override
  String toString() => 'UnTabviewState';

  @override
  UnTabviewState getStateCopy() {
    return UnTabviewState(0);
  }

  @override
  UnTabviewState getNewVersion() {
    return UnTabviewState(version+1);
  }

  @override
  Widget build() {
    // TODO: implement build
    return null;
  }
}

/// Initialized
class InTabviewState extends TabviewState {
  final List<TabModel> tabs;
  final List<Widget> pages;

  InTabviewState(version, {this.tabs, this.pages} ) : super(version,);

  @override
  String toString() => 'InMainState $pages';

  @override
  InTabviewState getStateCopy() {
    return InTabviewState(this.version, pages: this.pages, tabs: this.tabs);
  }

  @override
  InTabviewState getNewVersion() {
    return InTabviewState(version+1, pages: this.pages, tabs: this.tabs);
  }

  Widget build(){
    return TabViewScaffold(pages: pages, tabs: tabs);
  }
}

class ErrorTabviewState extends TabviewState {
  final String errorMessage;

  ErrorTabviewState(version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorTabviewState';

  @override
  ErrorTabviewState getStateCopy() {
    return ErrorTabviewState(this.version, this.errorMessage);
  }

  @override
  ErrorTabviewState getNewVersion() {
    return ErrorTabviewState(version+1, this.errorMessage);
  }

  @override
  Widget build() {
    // TODO: implement build
    return ErrorWidget('');
  }

  
}
