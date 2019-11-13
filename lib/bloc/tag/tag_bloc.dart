import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nature_things/bloc/tag/index.dart';
import 'dart:developer' as developer;

class TagBloc extends HydratedBloc<TagEvent, TagState> {
  static final TagBloc _tagBlocSingleton = TagBloc._internal();
  factory TagBloc() {
    return _tagBlocSingleton;
  }
  TagBloc._internal();
  
  dispose(){
    _tagBlocSingleton.dispose();
    super.close();
  }

  TagState get initialState => UnTagState(0);

  @override
  Stream<TagState> mapEventToState(
    TagEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'TagBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  TagState fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic> toJson(TagState state) {
    return null;
  }
}
