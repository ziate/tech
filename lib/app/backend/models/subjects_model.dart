/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
class SubjectsModel {
  int? id;
  String? name;
  String? cover;
  int? studyId;
  int? termId;
  int? status;
  String? extraField;

  SubjectsModel(
      {this.id,
      this.name,
      this.cover,
      this.studyId,
      this.termId,
      this.status,
      this.extraField});

  SubjectsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    studyId = json['study_id'];
    termId = json['term_id'];
    status = json['status'];
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['study_id'] = studyId;
    data['term_id'] = termId;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
