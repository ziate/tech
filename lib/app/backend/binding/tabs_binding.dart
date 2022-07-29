/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/controller/account_controller.dart';
import 'package:user/app/controller/home_controller.dart';
import 'package:user/app/controller/learning_controller.dart';
import 'package:user/app/controller/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => BottomTabsController(parser: Get.find()),
    );
    Get.lazyPut(
      () => HomeController(parser: Get.find()),
    );
    Get.lazyPut(
      () => LearningController(parser: Get.find()),
    );
    Get.lazyPut(
      () => AccountController(parser: Get.find()),
    );
  }
}
