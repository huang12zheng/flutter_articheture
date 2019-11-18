// import 'package:nature_things/bloc/user/index.dart';
import 'package:nature_things/bloc/setting/index.dart';

/// just mixin ? 
class SettingRepository {
  // final UserProvider _userProvider = UserProvider();
  final SettingProvider _settingProvider = SettingProvider();

  SettingRepository();

  void test(bool isError) {
    // this._userProvider.test(isError);
  }

  Future<SettingModel> getSetting() async {
    return await _settingProvider.loadAsync('1');
  }
}