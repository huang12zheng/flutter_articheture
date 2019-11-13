
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/setting/setting_model.dart';
import 'package:nature_things/bloc/setting/tab/tab_model.dart';

List<TabItem> filterTabs(SettingModel setting){
  List<TabModel> tabs = setting.tabs;
  return 
  tabs.where((TabModel tab) => TabItemData.mapToData[tab.module]!=null).  // filter
  map((TabModel tab) {
    TabItemDM data = TabItemData.mapToData[tab.module];
    return TabItem(data.defaultIcon,data.text,Colors.blue);
  }).toList();
}
