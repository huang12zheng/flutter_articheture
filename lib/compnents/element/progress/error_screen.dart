import 'package:flutter/material.dart';
import 'package:nature_things/compnents/components/scaffold/scaffold.dart';

class DefaultErrorScreen extends StatelessWidget {
  final String title;
  final String errorInfo;
  final VoidCallback callback;

  const DefaultErrorScreen({Key key, this.title, this.errorInfo, this.callback}) : super(key: key);
  // final Widget child;
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: title,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(errorInfo ?? 'Error'),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                child: Text("reload"),
                onPressed: callback ?? (){} ,
              ),
            ),
          ],
        )
      ),
    );
  }
}