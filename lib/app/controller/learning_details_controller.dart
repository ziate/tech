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
import 'package:user/app/backend/models/learning_details_model.dart';
import 'package:user/app/backend/parse/learning_details_parse.dart';

class LearningDetailsController extends GetxController implements GetxService {
  final LearningDetailsParser parser;
  int id = 0;
  String name = '';
  bool apiCalled = false;

  LearningDetailsModel _details = LearningDetailsModel();
  LearningDetailsModel get details => _details;

  final ScrollController scrollQuestionController = ScrollController();
  LearningDetailsController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments[0];
    name = Get.arguments[1];
    getDetails();
  }

  Future<void> getDetails() async {
    Response response = await parser.getDetails(id);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _details = LearningDetailsModel();
      LearningDetailsModel datas = LearningDetailsModel.fromJson(body);
      _details = datas;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }
}
