import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nature_things/bloc/setting/index.dart';
import 'package:nature_things/compnents/index.dart';

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

class InMainState extends MainState {
  final SettingModel setting;
  final List<DefaultTabItem> tabs;
  

  InMainState(version, {this.setting, this.tabs}) : super(version, [setting]);

  @override
  String toString() => 'InMainState $setting';

  @override
  InMainState getStateCopy() {
    return InMainState(this.version, setting: this.setting, tabs: this.tabs);
  }

  @override
  InMainState getNewVersion() {
    return InMainState(version+1, setting: this.setting, tabs: this.tabs);
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
