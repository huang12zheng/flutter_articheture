
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/setting/setting_model.dart';
import 'package:nature_things/bloc/setting/tab/tab_model.dart';
import 'package:nature_things/compnents/index.dart';

List<DefaultTabItem> filterTabs(SettingModel setting){
  List<TabModel> tabs = setting.tabs;
  return 
  tabs.where((TabModel tab) => TabItemData.mapToData[tab.module]!=null).
  map((TabModel tab)=> DefaultTabItem(module: tab.module,name: tab.name,)).toList();
}
