/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'dart:convert';

import 'package:user/app/backend/models/my_answer_model.dart';

class StatsModel {
  int? id;
  int? examId;
  int? uid;
  double? gained;
  double? total;
  int? result;
  // String? userAnswer;
  List<MyAnswerModel>? userAnswer;
  // String? realAnwer;
  List<MyAnswerModel>? realAnwer;
  int? status;
  String? extraField;

  StatsModel(
      {this.id,
      this.examId,
      this.uid,
      this.gained,
      this.total,
      this.result,
      this.userAnswer,
      this.realAnwer,
      this.status,
      this.extraField});

  StatsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    uid = json['uid'];
    gained = json['gained'].toDouble();
    total = json['total'].toDouble();
    result = json['result'];
    if (json['user_answer'] != null && json['user_answer'] != '') {
      userAnswer = [];
      var listItems = jsonDecode(json['user_answer']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          MyAnswerModel dataInfo = MyAnswerModel.fromJson(data);
          userAnswer?.add(dataInfo);
        });
      }
    } else {
      userAnswer = [];
    }

    if (json['real_anwer'] != null && json['real_anwer'] != '') {
      realAnwer = [];
      var listItems = jsonDecode(json['real_anwer']);
      if (listItems.isNotEmpty) {
        listItems.forEach((data) {
          MyAnswerModel dataInfo = MyAnswerModel.fromJson(data);
          realAnwer?.add(dataInfo);
        });
      }
    } else {
      realAnwer = [];
    }
    status = json['status'];
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['uid'] = uid;
    data['gained'] = gained;
    data['total'] = total;
    data['result'] = result;
    data['user_answer'] = userAnswer;
    data['real_anwer'] = realAnwer;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
