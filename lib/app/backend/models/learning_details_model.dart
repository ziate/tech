/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'dart:convert';

import 'package:user/app/backend/models/learning_content_model.dart';

class LearningDetailsModel {
  int? id;
  String? name;
  String? cover;
  int? studyId;
  int? termId;
  int? subjectId;
  List<LearningContentModel>? content;
  String? creatorName;
  String? creatorPhone;
  String? creatorPosition;
  int? totalQuestions;
  int? status;
  String? extraField;

  LearningDetailsModel(
      {this.id,
      this.name,
      this.cover,
      this.studyId,
      this.termId,
      this.subjectId,
      this.content,
      this.creatorName,
      this.creatorPhone,
      this.creatorPosition,
      this.totalQuestions,
      this.status,
      this.extraField});

  LearningDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    studyId = json['study_id'];
    termId = json['term_id'];
    subjectId = json['subject_id'];
    if (json['content'] != null && json['content'] != '') {
      content = [];
      var listItems = jsonDecode(json['content']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          LearningContentModel dataInfo = LearningContentModel.fromJson(data);
          content?.add(dataInfo);
        });
      }
    } else {
      content = [];
    }
    creatorName = json['creator_name'];
    creatorPhone = json['creator_phone'];
    creatorPosition = json['creator_position'];
    totalQuestions = json['totalQuestions'];
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
    data['subject_id'] = subjectId;
    data['content'] = content;
    data['creator_name'] = creatorName;
    data['creator_phone'] = creatorPhone;
    data['creator_position'] = creatorPosition;
    data['totalQuestions'] = totalQuestions;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
