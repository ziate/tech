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
import 'package:user/app/backend/models/subjects_model.dart';
import 'package:user/app/backend/parse/home_parse.dart';
import 'package:user/app/controller/exam_list_controller.dart';
import 'package:user/app/helper/router.dart';

class HomeController extends GetxController implements GetxService {
  final HomeParser parser;
  bool apiCalled = false;
  List<SubjectsModel> _subjectList = <SubjectsModel>[];
  List<SubjectsModel> get subjectList => _subjectList;
  HomeController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    getMySubjects();
  }

  Future<void> getMySubjects() async {
    Response response = await parser.getMySubjects();
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _subjectList = [];
      body.forEach((data) {
        SubjectsModel datas = SubjectsModel.fromJson(data);
        _subjectList.add(datas);
      });
      debugPrint(subjectList.length.toString());
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void onExamList(int subjectId, String name) {
    Get.delete<ExamListController>(force: true);
    Get.toNamed(AppRouter.getExamListRoutes(), arguments: [subjectId, name]);
  }
}
