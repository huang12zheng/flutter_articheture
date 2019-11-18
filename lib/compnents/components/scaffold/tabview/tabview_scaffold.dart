import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/setting/setting_model.dart';

// List colors=[Colors.blue,Colors.pink,Colors.orange];
class TabViewScaffold extends StatefulWidget  {
  final List<Widget> pages;
  final List<TabModel> tabs;

  const TabViewScaffold({Key key, this.pages, this.tabs }) : super(key: key);
  @override
  _TabViewScaffoldState createState() => _TabViewScaffoldState();
}

class _TabViewScaffoldState extends State<TabViewScaffold> {
  // TabController tabController;
  // int selectedPos = 0;
  final double bottomNavBarHeight = 60;
  CircularBottomNavigationController _navigationController;
  PageController controller;
  int lastTabLength;
  // PageController _pageController = PageController();
  List<Widget> pages;
  List<TabModel> tabs;
  @override
  void initState() {
    super.initState();
    pages = widget.pages;
    tabs  = widget.tabs;

    // _navigationController = new CircularBottomNavigationController(0);
    // controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          child: PageView.builder(
            itemBuilder: (ctx, index) => pages[index],
            itemCount: pages.length,
            controller: controller,
            // physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _navigationController.value = index;
              });
            },
          )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: tabs.length == 0 ? Container() : 
          CircularBottomNavigation(
            tabs.map2TabItem(),
            controller: _navigationController,
            barHeight: bottomNavBarHeight,
            selectedCallback: (int index) {
              controller.jumpToPage(index);
            },
          ),
        )
      ]
    );
  }

  @override
  void didUpdateWidget(TabViewScaffold oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (noDataInput) {
      // controller?.dispose();
      // _navigationController?.dispose();
      controller = null;
      _navigationController = null;
      return;
    }
    if (noDataBefore(oldWidget)) {
      // controller?.dispose();
      // _navigationController?.dispose();
      controller ??= PageController(initialPage: 0);
      _navigationController = CircularBottomNavigationController(0);
      return;
    }
    if (isDataSame(oldWidget)) return ;
    // controller?.dispose();
    // _navigationController?.dispose();
    int indexNew = getNewIndex(oldWidget);
    setController(indexNew);
    
    _navigationController = CircularBottomNavigationController(controller.page.toInt());
    tabs = widget.tabs;
    pages= widget.pages;
  }

  void setController(int indexNew) {
    if (indexNew == -1) controller = PageController(initialPage: 0);
    controller = PageController(initialPage: indexNew);
  }

  int getNewIndex(TabViewScaffold oldWidget) {
    int indexOld = controller.page.toInt();
    int indexNew = tabs.indexOf(oldWidget.tabs[indexOld]);
    return indexNew;
  }

  bool get noDataInput => widget.tabs == null;
  bool noDataBefore(oldWidget)=> oldWidget.tabs == null;
  bool isDataSame(TabViewScaffold oldWidget) => oldWidget.tabs.hashCode == widget.tabs.hashCode;


  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    _navigationController?.dispose();
  }
}
