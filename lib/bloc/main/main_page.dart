import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_things/bloc/main/index.dart';

class MainPage extends StatelessWidget {
  static const String routeName = "/main";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context)=> MainBloc()..add(
        LoadMainEvent('hz')
      ),
      child: MainScreen(),
    );
  }
}
