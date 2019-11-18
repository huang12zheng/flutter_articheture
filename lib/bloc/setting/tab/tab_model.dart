import 'package:flutter/material.dart';

class TabItemDM {
  final String text;
  final IconData defaultIcon;
 
  const TabItemDM(this.text, this.defaultIcon);
}

class TabItemData{
  TabItemData._();
  static const TabItemDM add =  TabItemDM('add',Icons.add);
  static const TabItemDM list = TabItemDM('list',Icons.list);
  static const TabItemDM compare_arrows = TabItemDM('compare_arrows',Icons.compare_arrows);

  static Map<String,TabItemDM>mapToData= {
    add.text    :   add,
    list.text   :   list,
    compare_arrows.text:  compare_arrows,

  };
}