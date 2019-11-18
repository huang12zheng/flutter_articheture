import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nature_things/bloc/setting/tab/tab_model.dart';

/// 1. what page user would set.
///   [bottomTab], [color], [font], [intl], [message]...
///   [bottomTab]: ["tab":{"id":"s","module":"1","name":"name"}]
///   [color]:{"color":"String"}
///   [font]:{"font":"String"}
///   [intl]:{"intl":"String"}
///   [message]:{"font":"String"}
/// 
  // [settings]:{ 
  //   "tab_module":[{"id":"s","module":"1","name":"name"}],
  //   "color":"String",
  //   "font":"String",
  //   "intl":"String",
  //   "font":"String"
  // }

class SettingModel with EquatableMixin{
  List<TabModel> tabs;
  String color;
  String font;
  String intl;

  SettingModel({this.tabs, this.color, this.font, this.intl});

  SettingModel.fromJson(Map<String, dynamic> json) {
    if (json['tabs'] != null) {
      tabs = new List<TabModel>();
      json['tabs'].forEach((v) {
        tabs.add(new TabModel.fromJson(v));
      });
    }
    color = json['color'];
    font = json['font'];
    intl = json['intl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tabs != null) {
      data['tabs'] = this.tabs.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    data['font'] = this.font;
    data['intl'] = this.intl;
    return data;
  }

  @override
  List<Object> get props => [tabs, color,font,intl];
}

class TabModel with EquatableMixin{
  String id;
  String module;
  String name;

  TabModel({this.id, this.module, this.name});

  TabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    module = json['module'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['module'] = this.module;
    data['name'] = this.name;
    return data;
  }

  @override
  List<Object> get props => [id,module,name];
}
extension FilterExtension on SettingModel{
  List<TabItem> filterTabs() {
    return 
    tabs.where((TabModel tab) => TabItemData.mapToData[tab.module]!=null). 
      map((TabModel tab) {
        TabItemDM data = TabItemData.mapToData[tab.module];
        return TabItem(data.defaultIcon,data.text,Colors.blue);
      }).toList();
  }
}

extension MapExtension on List<TabModel>{
  List<TabItem> map2TabItem() {
    return 
    this.where((TabModel tab) => TabItemData.mapToData[tab.module]!=null). 
      map((TabModel tab) {
        TabItemDM data = TabItemData.mapToData[tab.module];
        return TabItem(data.defaultIcon,data.text,Colors.blue);
      }).toList();
  }
}

extension ListToJsonExtension on List<TabModel>{
  String toJson() {
    return this.map((model)=>model.toJson().toString()).join();
  }
}