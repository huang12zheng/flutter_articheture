
import 'package:flutter/material.dart';

class OptionBean{
  final String title;
  final String subTitle;

  OptionBean({this.title, this.subTitle});

  toString()=> 'OptionBean{ hashCode:$hashCode, title:$title, subTitle:$subTitle }';
}

mixin ZxGridViewMixin on StatelessWidget{
  List<OptionBean>     get  options;
  IndexedWidgetBuilder get  itemBuilder;
  SliverGridDelegate   get  gridDelegate;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: itemBuilder,
      gridDelegate: gridDelegate ?? SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3 ),
    );
  } 
}

class ZxGridView extends StatelessWidget with ZxGridViewMixin {

  final List<OptionBean> options;
  final SliverGridDelegate gridDelegate;
  final IndexedWidgetBuilder itemBuilder;
  ZxGridView({Key key, this.options, @required this.itemBuilder, this.gridDelegate}) : super(key: key);
}