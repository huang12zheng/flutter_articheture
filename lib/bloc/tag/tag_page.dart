import 'package:flutter/material.dart';
import 'package:nature_things/bloc/tag/index.dart';

class TagPage extends StatelessWidget {
  static const String routeName = "/tag";

  @override
  Widget build(BuildContext context) {
    var _tagBloc = TagBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tag"),
      ),
      body: TagScreen(tagBloc: _tagBloc),
    );
  }
}
