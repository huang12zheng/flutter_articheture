import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_things/bloc/main/index.dart';
import 'package:nature_things/compnents/index.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key key,
    @required MainBloc mainBloc,
  })  : _mainBloc = mainBloc,
        super(key: key);

  final MainBloc _mainBloc;

  @override
  MainScreenState createState() {
    return MainScreenState(_mainBloc);
  }
}
List colors=[Colors.blue,Colors.pink,Colors.orange];
class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final MainBloc _mainBloc;
  MainScreenState(this._mainBloc);
  TabController tabController;
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    this._load();

    tabController = TabController(vsync: this, length: 2);
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        bloc: widget._mainBloc,
        builder: (
          BuildContext context,
          MainState currentState,
        ) {
          if (currentState is UnMainState) {
            // _load();
            return DefaultCircularProgressIndicator();
          }
          if (currentState is ErrorMainState) {
            return DefaultErrorScreen(
              errorInfo: currentState.errorMessage,
              callback: this._load,
            );
          }
          if (currentState is InMainState)
            return Scaffold(
              appBar: AppBar(
                title: Text("Main"),
              ),
              body: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomNavBarHeight),
                    child: TabBarView(
                      controller: tabController,
                      children: <Widget>[
                          Container(
                              color: colors[0],
                          ),
                          Container(
                              color: colors[1],
                          ),
                      ],
                    ),
                  ),
                  Align(alignment: Alignment.bottomCenter,
                    child: currentState.tabs.length == 0 ? Container() : 
                    CircularBottomNavigation(
                      currentState.tabs,
                      controller: _navigationController,
                      barHeight: bottomNavBarHeight,
                      selectedCallback: (int index) {
                        this.selectedPos = selectedPos;
                        tabController.animateTo(index);
                        print(index);
                      },
                    ),
                  )
                ]
              )
              
              
            );
          return DefaultCircularProgressIndicator();
        });
  }

  void _load([bool isError = false]) {
    // widget._mainBloc.add(UnMainEvent());
    // widget._mainBloc.add(LoadMainEvent(true));
    widget._mainBloc.add(LoadMainEvent('hz'));
  }
}
