import 'package:equatable/equatable.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
/// person setting tag { 'userId':'', 'order':['tagId': "order"],'color'}
/// person PersonTagFiled { 'tagId': "order", 'color':'',level:'' }
/// tag module {}
/// tagOrder { 'userId':'', 'tagId': "order"}
/// 
class AutogeneratedTag {
  final List<TagModel> results;

  AutogeneratedTag({this.results});

  factory AutogeneratedTag.fromJson(Map<String, dynamic> json) {
    List<TagModel> temp;
    if (json['results'] != null) {
      temp = List<TagModel>();
      json['results'].forEach((v) {
        temp.add(TagModel.fromJson(v));
      });
    }
    return AutogeneratedTag(results: temp);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TagModel extends Equatable {
  final int id;
  final String name;

  TagModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(json['id'], json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
  
}