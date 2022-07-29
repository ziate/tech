/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:jiffy/jiffy.dart';

class ExamListModel {
  int? id;
  String? name;
  String? cover;
  int? studyId;
  int? termId;
  int? subjectId;
  double? passingMarks;
  double? negativeMarks;
  String? startTime;
  String? endTime;
  String? examinerName;
  String? examinerPhone;
  String? examinerPosition;
  double? totalQuestions;
  double? haveNegative;
  int? status;
  String? extraField;
  bool? attempted;
  Stats? stats;

  ExamListModel(
      {this.id,
      this.name,
      this.cover,
      this.studyId,
      this.termId,
      this.subjectId,
      this.passingMarks,
      this.negativeMarks,
      this.startTime,
      this.endTime,
      this.examinerName,
      this.examinerPhone,
      this.examinerPosition,
      this.totalQuestions,
      this.haveNegative,
      this.status,
      this.extraField,
      this.attempted,
      this.stats});

  ExamListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    studyId = json['study_id'];
    termId = json['term_id'];
    subjectId = json['subject_id'];
    passingMarks = json['passingMarks'].toDouble();
    negativeMarks = json['negativeMarks'].toDouble();
    startTime = Jiffy(json['startTime']).yMMMd;
    endTime = Jiffy(json['endTime']).yMMMd;
    examinerName = json['examinerName'];
    examinerPhone = json['examinerPhone'];
    examinerPosition = json['examinerPosition'];
    totalQuestions = json['totalQuestions'].toDouble();
    haveNegative = json['haveNegative'].toDouble();
    status = json['status'];
    extraField = json['extra_field'];
    attempted = json['attempted'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['study_id'] = studyId;
    data['term_id'] = termId;
    data['subject_id'] = subjectId;
    data['passingMarks'] = passingMarks;
    data['negativeMarks'] = negativeMarks;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['examinerName'] = examinerName;
    data['examinerPhone'] = examinerPhone;
    data['examinerPosition'] = examinerPosition;
    data['totalQuestions'] = totalQuestions;
    data['haveNegative'] = haveNegative;
    data['status'] = status;
    data['extra_field'] = extraField;
    data['attempted'] = attempted;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}

class Stats {
  int? id;
  int? examId;
  int? uid;
  int? gained;
  int? total;
  int? result;
  int? status;

  Stats(
      {this.id,
      this.examId,
      this.uid,
      this.gained,
      this.total,
      this.result,
      this.status});

  Stats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    uid = json['uid'];
    gained = json['gained'];
    total = json['total'];
    result = json['result'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['uid'] = uid;
    data['gained'] = gained;
    data['total'] = total;
    data['result'] = result;
    data['status'] = status;
    return data;
  }
}
