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
import 'package:user/app/backend/parse/account_parse.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/theme.dart';

class AccountController extends GetxController implements GetxService {
  final AccountParser parser;
  String cover = '';
  String name = '';
  String email = '';
  AccountController({required this.parser});
  @override
  void onInit() {
    super.onInit();
    cover = parser.getCover();
    name = parser.getName();
    email = parser.getEmail();
  }

  void updateProfile() {
    cover = parser.getCover();
    name = parser.getName();
    email = parser.getEmail();
    update();
  }

  Future<void> logout() async {
    Get.dialog(
        SimpleDialog(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const CircularProgressIndicator(
                  color: ThemeProvider.appColor,
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                    child: Text(
                  "Please wait".tr,
                  style: const TextStyle(fontFamily: 'bold'),
                )),
              ],
            )
          ],
        ),
        barrierDismissible: false);
    Response response = await parser.logout();
    Get.back();
    if (response.statusCode == 200) {
      parser.clearAccount();
      Get.offAndToNamed(AppRouter.getLoginRoutes());
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }
}
