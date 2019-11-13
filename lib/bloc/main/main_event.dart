import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/main/index.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

import 'package:nature_things/bloc/setting/index.dart';
import 'package:nature_things/bloc/setting/setting_connect.dart';

@immutable
abstract class MainEvent {
  Future<MainState> applyAsync(
      {MainState currentState, MainBloc bloc});
  final MainRepository _mainRepository = MainRepository();
  final SettingRepository _settingRepository = SettingRepository();
}

class UnMainEvent extends MainEvent {
  @override
  Future<MainState> applyAsync({MainState currentState, MainBloc bloc}) async {
    return UnMainState(0);
  }
}

class LoadMainEvent extends MainEvent {
   
  final String userId;
  @override
  String toString() => 'LoadMainEvent $userId';

  LoadMainEvent(this.userId);

  @override
  Future<MainState> applyAsync(
      {MainState currentState, MainBloc bloc}) async {
    try {
      if (currentState is InMainState) {
        return currentState.getNewVersion();
      }
      List<Widget> pages=[Container(color: Colors.blue),Container(color: Colors.red)];
      SettingModel setting = await _settingRepository.getSetting();
      return InMainState(0, pages: pages, tabs: filterTabs(setting));
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      return ErrorMainState(0, _?.toString());
    }
  }
}
