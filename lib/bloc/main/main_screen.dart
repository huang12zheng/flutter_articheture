import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

  @override
  void initState() {
    super.initState();
    this._load();

    tabController = TabController(vsync: this, length: 2)..addListener((){
            setState(() {
                // currentIndex=tabController.index;
            });
        });
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
              bottomNavigationBar: currentState.tabs.length == 0 ? Container() :
                CurvedNavigationBar(
                  buttonBackgroundColor: Color(0xFFC69B71),
                  backgroundColor: Color(0xFF8E8E8E),
                  items: currentState.tabs,
                  index: tabController.index,
                  onTap: (index) {
                    //Handle button tap
                    tabController.animateTo(index);
                  },
                ),
              body: TabBarView(
                 controller: tabController,
                children: <Widget>[
                    Container(
                        color: colors[0],
                    ),
                    Container(
                        color: colors[1],
                    ),
                    // Container(
                    //     color: colors[2],
                    // )
                ],
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
