import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// List colors=[Colors.blue,Colors.pink,Colors.orange];
class TabViewScaffold extends StatefulWidget  {
  // List<Widget> pages;
  // List<Widget> tabs;

  const TabViewScaffold({Key key }) : super(key: key);
  @override
  _TabViewScaffoldState createState() => _TabViewScaffoldState();
}

class _TabViewScaffoldState extends State<TabViewScaffold> {
  // TabController tabController;
  // int selectedPos = 0;
  final double bottomNavBarHeight = 60;
  CircularBottomNavigationController _navigationController;
  // PageController _pageController = PageController();
  
  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(0);
  }

  @override
  Widget build(BuildContext context) {
    return 
    Consumer<TabViewModel>(
      builder: (_,model,__)=> Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: bottomNavBarHeight),
              child: PageView.builder(
                itemBuilder: (ctx, index) => model.pages[index],
                itemCount: model.pages.length,
                controller: model.controller,
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
              child: model.tabs.length == 0 ? Container() : 
              CircularBottomNavigation(
                model.tabs,
                controller: _navigationController,
                barHeight: bottomNavBarHeight,
                selectedCallback: (int index) {
                  model.controller.jumpToPage(index);
                },
              ),
            )
          ]
        )
      )
    );
  }
}

class TabViewModel  with ChangeNotifier {
  PageController controller = PageController(initialPage: 0);
  ScrollController scrollController = new ScrollController();
  // GlobalKey kFind = GlobalKey();
  // GlobalKey kGroup = GlobalKey();


  // List<StatefulWidget> get pages => _pages;
  TabViewModel({this.pages,this.tabs});
  List<Widget> pages;
  List<TabItem> tabs;

  changeTabView(List<Widget> pages, List<TabItem> tabs){
    this.pages = pages;
    this.tabs  = tabs;
    notifyListeners();
  }

  backToTop() {
    if (scrollController != null) scrollController.position.jumpTo(5);
  }

  // init(){
    
  // }

  dispose(){
    super.dispose();
    controller.dispose();
    scrollController.dispose();
  }
}


class PageModel  with ChangeNotifier {
  PageController controller = PageController(initialPage: 0);
  ScrollController scrollController = new ScrollController();
  // GlobalKey kFind = GlobalKey();
  // GlobalKey kGroup = GlobalKey();


  // List<StatefulWidget> get pages => _pages;
  PageModel(this.pages);
  List<StatefulWidget> pages;

  backToTop() {
    if (scrollController != null) scrollController.position.jumpTo(5);
  }

  init(){

  }

  dispose(){
    super.dispose();
    controller.dispose();
    scrollController.dispose();
  }
}
