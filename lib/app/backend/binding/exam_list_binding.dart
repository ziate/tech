/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/controller/exam_list_controller.dart';

class ExamListBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ExamListController(parser: Get.find()),
    );
  }
}
