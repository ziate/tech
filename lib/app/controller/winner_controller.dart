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
import 'package:user/app/backend/models/topper_model.dart';
import 'package:user/app/backend/parse/winner_parse.dart';

class WinnerController extends GetxController implements GetxService {
  final WinnerParser parser;

  int id = 0;
  String name = '';
  bool apiCalled = false;
  List<TopperModel> _topperList = <TopperModel>[];
  List<TopperModel> get topperList => _topperList;
  WinnerController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments[0];
    name = Get.arguments[1];
    // id = 1;
    // name = 'Exam Name';
    getTopperInfo();
  }

  Future<void> getTopperInfo() async {
    Response response = await parser.getTopperInfo(id);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["topper"];
      _topperList = [];
      body.forEach((data) {
        TopperModel datas = TopperModel.fromJson(data);
        _topperList.add(datas);
      });
      debugPrint(_topperList.length.toString());
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }
}
