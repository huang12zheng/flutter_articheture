import 'package:nature_things/bloc/main/index.dart';

class MainRepository {
  final MainProvider _mainProvider = MainProvider();

  MainRepository();

  void test(bool isError) {
    this._mainProvider.test(isError);
  }
}