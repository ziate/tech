/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/api/handler.dart';
import 'package:user/app/backend/models/question_model.dart';
import 'package:user/app/backend/models/stats_model.dart';
import 'package:user/app/backend/parse/exam_stats_parse.dart';

class ExamStatsController extends GetxController implements GetxService {
  final ExamStatsParser parser;
  int examId = 0;
  bool apiCalled = false;

  StatsModel _stats = StatsModel();
  StatsModel get stats => _stats;

  QuestionModel _questionData = QuestionModel();
  QuestionModel get questionData => _questionData;

  final ScrollController scrollQuestionController = ScrollController();

  List<String> alphaIndex = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  ExamStatsController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    examId = Get.arguments[0];
    getMyStats();
  }

  Future<void> getMyStats() async {
    Response response = await parser.getExamStats(examId);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      dynamic question = myMap['question'];
      _stats = StatsModel();
      StatsModel data = StatsModel.fromJson(body);
      _stats = data;
      _questionData = QuestionModel();
      QuestionModel examQuestion = QuestionModel.fromJson(question);
      _questionData = examQuestion;
      debugPrint(_stats.realAnwer!.length.toString());
      debugPrint(_questionData.questionsList!.length.toString());
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  String getAplphaIndex(int index) {
    return alphaIndex[index].toString();
  }
}
