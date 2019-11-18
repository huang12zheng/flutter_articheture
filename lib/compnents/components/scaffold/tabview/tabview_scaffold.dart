import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/setting/setting_model.dart';

class TabViewScaffold extends StatefulWidget  {
  final List<Widget> pages;
  final List<TabModel> tabs;

  const TabViewScaffold({Key key, this.pages, this.tabs }) : super(key: key);
  @override
  _TabViewScaffoldState createState() => _TabViewScaffoldState();
}

class _TabViewScaffoldState extends State<TabViewScaffold> {
  final double bottomNavBarHeight = 60;
  CircularBottomNavigationController _navigationController;
  PageController controller;
  int lastTabLength;

  List<Widget> pages;
  List<TabModel> tabs;
  @override
  void initState() {
    super.initState();
    pages = widget.pages;
    tabs  = widget.tabs;
    _navigationController = new CircularBottomNavigationController(0);
    controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          child: PageView.builder(
            itemBuilder: (ctx, index) => pages[index],
            itemCount: pages?.length ?? 0,
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _navigationController.value = index;
              });
            },
          )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: (tabs?.length??0) == 0 ? Container() : 
          StatefulBuilder(
            key: ValueKey(tabs.length),
            builder: (BuildContext context, setState) => CircularBottomNavigation(
              tabs.map2TabItem(),
              controller: _navigationController,
              barHeight: bottomNavBarHeight,
              selectedCallback: (int index) {
                controller.jumpToPage(index);
              },
            )
          ),
        )
      ]
    );
  }

  @override
  void didUpdateWidget(TabViewScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (noDataInput) {
      tabs = widget.tabs;
      pages= widget.pages;
      controller = PageController(initialPage: 0);
      _navigationController = CircularBottomNavigationController(0);
      return;
    }
    if (noDataBefore(oldWidget)) {
      tabs = widget.tabs;
      pages= widget.pages;
      controller ??= PageController(initialPage: 0);
      _navigationController = CircularBottomNavigationController(0);
      return;
    }
    if (isDataSame(oldWidget)) return ;
    int indexNew = getNewIndex(oldWidget);
    
    setController(indexNew);
    tabs = widget.tabs;
    pages= widget.pages;
    
  }

  void setController(int indexNew) {
    if (indexNew == -1) indexNew=0;
    controller = PageController(initialPage: indexNew);
    _navigationController = CircularBottomNavigationController(indexNew);
  }

  int getNewIndex(TabViewScaffold oldWidget) {
    int indexOld = controller.page.toInt();
    int indexNew = widget.tabs.indexOf(oldWidget.tabs[indexOld]);
    return indexNew;
  }

  bool get noDataInput => widget.tabs == null || widget.tabs.length==0;
  bool noDataBefore(oldWidget)=> oldWidget.tabs == null || oldWidget.tabs.length==0;
  bool isDataSame(TabViewScaffold oldWidget) => oldWidget.tabs.toJson() == widget.tabs.toJson();


  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    _navigationController?.dispose();
  }
}
