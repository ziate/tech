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
import 'package:user/app/backend/models/exam_list_model.dart';
import 'package:user/app/backend/parse/exam_list_parse.dart';
import 'package:user/app/controller/exam_paper_controller.dart';
import 'package:user/app/controller/exam_stats_controller.dart';
import 'package:user/app/controller/winner_controller.dart';
import 'package:user/app/helper/router.dart';

class ExamListController extends GetxController implements GetxService {
  final ExamListParser parser;
  bool apiCalled = false;
  int subjectId = 0;
  String subjectName = '';
  List<ExamListModel> _examList = <ExamListModel>[];
  List<ExamListModel> get examList => _examList;
  ExamListController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    subjectId = Get.arguments[0];
    subjectName = Get.arguments[1];
    getMyExams();
  }

  Future<void> getMyExams() async {
    Response response = await parser.getMyExams(subjectId);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _examList = [];
      body.forEach((data) {
        ExamListModel datas = ExamListModel.fromJson(data);
        _examList.add(datas);
      });
      debugPrint(_examList.length.toString());
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void onExamPaper(int id, String name) {
    Get.delete<ExamPaperController>(force: true);
    Get.toNamed(AppRouter.getExamPapersRoutes(), arguments: [id, name]);
  }

  void onExamStats(int id, String name) {
    Get.delete<ExamStatsController>(force: true);
    Get.toNamed(AppRouter.getExamStatsRoutes(), arguments: [id]);
  }

  void onWinnerRoutes(int id, String name) {
    Get.delete<WinnerController>(force: true);
    Get.toNamed(AppRouter.getWinnersRoutes(), arguments: [id, name]);
  }
}
