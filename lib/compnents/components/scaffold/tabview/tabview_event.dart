import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/setting/index.dart';
import 'package:nature_things/compnents/components/bar/bottom_bar/tab/index.dart';
import 'package:nature_things/compnents/components/scaffold/tabview/index.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

@immutable
abstract class TabviewEvent {
  Future<dynamic> applyAsync(
      {TabviewState currentState, TabviewBloc bloc});
  final SettingRepository _settingRepository = SettingRepository();
}

class UnTabviewEvent extends TabviewEvent {
  @override
  Future<TabviewState> applyAsync({TabviewState currentState, TabviewBloc bloc}) async {
    return UnTabviewState(0);
  }
}

class ReLoadTabviewEvent extends TabviewEvent {

  @override
  String toString() => 'LoadTabviewEvent';

  ReLoadTabviewEvent();

  @override
  Future<TabviewState> applyAsync(
      {TabviewState currentState, TabviewBloc bloc}) async {
    try {
      List<Widget> pages=[Container(color: Colors.blue),Container(color: Colors.red)];
      SettingModel setting = await _settingRepository.getSetting();
      // return InMainState(0, pages: pages, tabs: setting.filterTabs() );
      bloc.tabBloc = TabBloc(setting.filterTabs());
      return InTabviewState(0, pages: pages, tabs: setting.tabs );

    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadTabviewEvent', error: _, stackTrace: stackTrace);
      return ErrorTabviewState(0, _?.toString());
    }
  }
}

class LoadTabviewEvent extends TabviewEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadTabviewEvent';

  LoadTabviewEvent(this.isError);

  @override
  Future<void> applyAsync(
      {TabviewState currentState, TabviewBloc bloc}) async {
    try {
      if (currentState is InTabviewState) {
        return currentState.getNewVersion();
      }
      bloc.add(ReLoadTabviewEvent());
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadTabviewEvent', error: _, stackTrace: stackTrace);
      return ErrorTabviewState(0, _?.toString());
    }
  }
}