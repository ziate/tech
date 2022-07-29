/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
class StudiesModel {
  int? id;
  String? name;
  String? cover;
  int? status;
  String? extraField;

  StudiesModel({this.id, this.name, this.cover, this.status, this.extraField});

  StudiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    status = json['status'];
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
