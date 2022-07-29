/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/parse/result_parse.dart';
import 'package:user/app/controller/exam_stats_controller.dart';
import 'package:user/app/helper/router.dart';

class ResultController extends GetxController implements GetxService {
  final ResultParser parser;
  late ConfettiController controllerCenter;

  bool result = false;
  int examId = 0;
  double gained = 0;
  double total = 0;
  ResultController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    result = Get.arguments[0];
    examId = Get.arguments[1];
    gained = Get.arguments[2];
    total = Get.arguments[3];
    controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    controllerCenter.play();
  }

  @override
  void dispose() {
    super.dispose();
    controllerCenter.dispose();
  }

  void onExamStats() {
    Get.delete<ExamStatsController>(force: true);
    Get.toNamed(AppRouter.getExamStatsRoutes(), arguments: [examId]);
  }

  void onHome() {
    debugPrint('go to home');
    Get.offNamed(AppRouter.getTabsRoutes());
  }
}
