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
import 'package:user/app/backend/models/learning_list_model.dart';
import 'package:user/app/backend/parse/learning_list_parse.dart';
import 'package:user/app/controller/learning_details_controller.dart';
import 'package:user/app/helper/router.dart';

class LearningListController extends GetxController implements GetxService {
  final LearningListParser parser;
  bool apiCalled = false;
  int subjectId = 0;
  String subjectName = '';
  List<LearningListModel> _list = <LearningListModel>[];
  List<LearningListModel> get list => _list;
  LearningListController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    subjectId = Get.arguments[0];
    subjectName = Get.arguments[1];
    getList();
  }

  Future<void> getList() async {
    Response response = await parser.getList(subjectId);
    apiCalled = true;
    debugPrint(response.bodyString);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _list = [];
      body.forEach((data) {
        LearningListModel datas = LearningListModel.fromJson(data);
        _list.add(datas);
      });
      debugPrint(_list.length.toString());
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void onStudyInfo(int id, String name) {
    Get.delete<LearningDetailsController>(force: true);
    Get.toNamed(AppRouter.getLearningDetailsRoutes(), arguments: [id, name]);
  }
}
