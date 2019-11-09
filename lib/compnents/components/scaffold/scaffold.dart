import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const DefaultScaffold({Key key, this.title, this.child}) : assert(child != null),super(key: key);
  @override
  Widget build(BuildContext context) {
    if (title == null) 
    return Scaffold(
      body: Center(
        child: child,
      ),
    );

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: Center(
        child: child,
      ),
    );
  }
}