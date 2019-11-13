import 'package:nature_things/bloc/tag/index.dart';

class TagRepository {
  final TagProvider _tagProvider = TagProvider();

  TagRepository();

  void test(bool isError) {
    this._tagProvider.test(isError);
  }
}