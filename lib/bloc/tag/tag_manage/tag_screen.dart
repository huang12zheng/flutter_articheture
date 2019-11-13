import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_things/bloc/tag/index.dart';
import 'package:nature_things/compnents/index.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({
    Key key,
    @required TagBloc tagBloc,
  })  : _tagBloc = tagBloc,
        super(key: key);

  final TagBloc _tagBloc;

  @override
  TagScreenState createState() {
    return TagScreenState(_tagBloc);
  }
}

class TagScreenState extends State<TagScreen> {
  final TagBloc _tagBloc;
  TagScreenState(this._tagBloc);

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBloc, TagState>(
        builder: (
          BuildContext context,
          TagState currentState,
        ) {
          if (currentState is UnTagState) {
            return DefaultCircularProgressIndicator();
          }
          if (currentState is ErrorTagState) {
            return DefaultErrorScreen(
              errorInfo: currentState.errorMessage,
              callback: this._load,
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Flutter files: done"),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text("throw error"),
                    onPressed: () => this._load(true),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _load([bool isError = false]) {

  }
}
