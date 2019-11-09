import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_things/bloc/main/index.dart';
import 'package:nature_things/compnents/components/scaffold/tabview_scaffold.dart';
import 'package:nature_things/compnents/index.dart';
import 'package:nature_things/util/provider/provider_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key,})  : super(key: key);

  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}
class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    this._init();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        builder: (
          BuildContext context,
          MainState currentState,
        ) {
          if (currentState is UnMainState) {
            return DefaultCircularProgressIndicator();
          }
          if (currentState is ErrorMainState) {
            return DefaultErrorScreen(
              errorInfo: currentState.errorMessage,
              callback: this._load,
            );
          }
          if (currentState is InMainState)
            return ProviderWidget<TabViewModel>(
              model: TabViewModel(tabs: currentState.tabs,pages: currentState.pages),
              builder: (_,model,__)=>TabViewScaffold(),
            );
          return DefaultCircularProgressIndicator();
        });
  }
  void _init(){}
  void _load() {
    BlocProvider.of<MainBloc>(context).add(LoadMainEvent('hz'));
  }
}
