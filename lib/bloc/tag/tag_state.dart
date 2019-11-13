import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TagState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final Iterable propss;
  TagState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  TagState getStateCopy();

  TagState getNewVersion();

  @override
  List<Object> get props => (propss);
}

/// UnInitialized
class UnTagState extends TagState {

  UnTagState(version) : super(version);

  @override
  String toString() => 'UnTagState';

  @override
  UnTagState getStateCopy() {
    return UnTagState(0);
  }

  @override
  UnTagState getNewVersion() {
    return UnTagState(version+1);
  }
}

/// Initialized
class InTagState extends TagState {
  final String hello;

  InTagState(version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InTagState $hello';

  @override
  InTagState getStateCopy() {
    return InTagState(this.version, this.hello);
  }

  @override
  InTagState getNewVersion() {
    return InTagState(version+1, this.hello);
  }
}

class ErrorTagState extends TagState {
  final String errorMessage;

  ErrorTagState(version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorTagState';

  @override
  ErrorTagState getStateCopy() {
    return ErrorTagState(this.version, this.errorMessage);
  }

  @override
  ErrorTagState getNewVersion() {
    return ErrorTagState(version+1, this.errorMessage);
  }
}
