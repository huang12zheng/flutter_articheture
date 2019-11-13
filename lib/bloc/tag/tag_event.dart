import 'dart:async';
import 'package:nature_things/bloc/tag/index.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

@immutable
abstract class TagEvent {
  Future<TagState> applyAsync(
      {TagState currentState, TagBloc bloc});
  final TagRepository _tagRepository = TagRepository();
}

class UnTagEvent extends TagEvent {
  @override
  Future<TagState> applyAsync({TagState currentState, TagBloc bloc}) async {
    return UnTagState(0);
  }
}

class LoadTagEvent extends TagEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadTagEvent';

  LoadTagEvent(this.isError);

  @override
  Future<TagState> applyAsync(
      {TagState currentState, TagBloc bloc}) async {
    try {
      if (currentState is InTagState) {
        return currentState.getNewVersion();
      }
      await Future.delayed(Duration(seconds: 2));
      this._tagRepository.test(this.isError);
      return InTagState(0, "Hello world");
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadTagEvent', error: _, stackTrace: stackTrace);
      return ErrorTagState(0, _?.toString());
    }
  }
}
