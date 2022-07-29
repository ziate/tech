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
import 'package:user/app/backend/models/user_model.dart';
import 'package:user/app/backend/parse/login_parse.dart';
import 'package:user/app/controller/home_controller.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/theme.dart';
import 'package:user/app/util/toast.dart';

class LoginController extends GetxController implements GetxService {
  final LoginParser parser;

  final emailAddress = TextEditingController();
  final password = TextEditingController();
  RxBool passwordVisible = false.obs;
  LoginController({required this.parser});

  void togglePassword() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }

  void saveLanguage(String code) {
    parser.saveLanguage(code);
  }

  Future<void> login() async {
    if (emailAddress.text == '' || password.text == '') {
      showToast('All fields are required');
      return;
    }

    if (!GetUtils.isEmail(emailAddress.text)) {
      showToast('Email is not valid');
      return;
    }

    var param = {
      "email": emailAddress.text,
      "password": password.text,
    };

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

    Response response = await parser.login(param);
    Get.back();
    debugPrint(response.bodyString);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['user'] != '' &&
          myMap['token'] != '' &&
          myMap['user']['type'] == 1) {
        if (myMap['user']['status'] == 1) {
          UserModel data = UserModel.fromJson(myMap['user']);
          parser.saveInfo(
              myMap['token'],
              data.id.toString(),
              data.firstName.toString(),
              data.lastName.toString(),
              data.email.toString(),
              data.cover.toString(),
              data.mobile.toString(),
              data.termId as int,
              data.studyId as int);
          var updateParam = {
            "id": data.id.toString(),
            'fcm_token': parser.getFcmToken(),
          };
          await parser.updateProfile(updateParam, myMap['token']);
          Get.delete<HomeController>(force: true);
          Get.offNamed(AppRouter.getTabsRoutes());
        } else {
          showToast('Your account is suspended');
        }
      } else {
        showToast('Something went wrong while login');
      }
      update();
    } else if (response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['error'] != '') {
        showToast(myMap['error']);
      } else {
        showToast('Something went wrong');
      }
      update();
    } else {
      ApiChecker.checkApi(response);
      update();
    }
    update();
  }
}
