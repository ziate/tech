/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/controller/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => LanguageController(parser: Get.find()),
    );
  }
}
