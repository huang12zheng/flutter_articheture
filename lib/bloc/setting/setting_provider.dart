import 'dart:async';

import 'package:nature_things/bloc/setting/setting_model.dart';

// class UserProvider {
//   Future<void> loadAsync(String token) async {
//     /// write from keystore/keychain
//     await Future.delayed(Duration(seconds: 2));
//   }

//   Future<void> saveAsync(String token) async {
//     /// write from keystore/keychain
//     await Future.delayed(Duration(seconds: 2));
//   }

//   void test(bool isError) {
//     if (isError == true){
//       throw Exception("manual error");
//     }
//   }
// }
// CURD
class SettingProvider {
  Future<SettingModel> loadAsync(String token) async {
    /// write from keystore/keychain
    return await Future<SettingModel>.delayed(Duration(seconds: 2),(){
      List<TabModel> tabs = [
        TabModel(id: "1", module: "add", name: "s"),
        TabModel(id: "2", module: "list", name: "2"),
      ];
      return SettingModel(color: 'default', font: 'default', intl: 'en',tabs: tabs);
    });
  }

  Future<void> saveAsync(String token) async {
    /// write from keystore/keychain
    await Future.delayed(Duration(seconds: 2));
  }
}
