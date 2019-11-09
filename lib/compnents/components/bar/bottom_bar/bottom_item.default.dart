// import 'package:flutter/material.dart';
// import 'package:nature_things/bloc/setting/tab/tab_model.dart';

// class DefaultTabItem extends StatelessWidget {
//   // final TabItemDM data;
//   final String module;
//   /// todo: Do support ‘’ and ' '？
//   final String name;
  

//   const DefaultTabItem({Key key, this.module, this.name}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TabItemDM data = TabItemData.mapToData[module];
//     return Column(children: <Widget>[
//       /// IconThemeData size 24 default
//       SizedBox(height: 12,),
//       Icon(data.defaultIcon),
//       Text(name ?? data.text),
//     ],);
//   }
// }