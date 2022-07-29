/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/controller/splash_controller.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/toast.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      showToast('Session expired!'.tr);
      Get.find<SplashController>().removeCreds();
      Get.offNamed(AppRouter.getLoginRoutes());
    } else {
      showToast(response.statusText.toString().tr);
    }
  }
}
