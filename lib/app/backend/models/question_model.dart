/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'dart:convert';

import 'package:user/app/backend/models/question_list_model.dart';

class QuestionModel {
  int? id;
  int? examId;
  List<QuestionListModel>? questionsList;
  int? status;
  String? extraField;

  QuestionModel(
      {this.id, this.examId, this.questionsList, this.status, this.extraField});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    if (json['questionsList'] != null && json['questionsList'] != '') {
      questionsList = [];
      var listItems = jsonDecode(json['questionsList']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          QuestionListModel dataInfo = QuestionListModel.fromJson(data);
          questionsList?.add(dataInfo);
        });
      }
    } else {
      questionsList = [];
    }
    status = json['status'];
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['questionsList'] = questionsList;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
