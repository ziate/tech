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
import 'package:user/app/backend/models/language_model.dart';
import 'package:user/app/backend/models/settings_model.dart';
import 'package:user/app/backend/models/support_model.dart';
import 'package:user/app/backend/parse/splash_parse.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashController extends GetxController implements GetxService {
  final SplashParser parser;
  late LanguageModel _defaultLanguage;
  LanguageModel get defaultLanguage => _defaultLanguage;
  SplashController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    FirebaseMessaging.instance.getToken().then((value) {
      debugPrint(value.toString());
      parser.saveDeviceToken(value.toString());
    });
  }

  bool showLogin() {
    return parser.showLoggedIn();
  }

  Future<bool> initSharedData() {
    return parser.initAppSettings();
  }

  void removeCreds() {
    parser.removeCreds();
  }

  Future<bool> getConfigData() async {
    Response response = await parser.getAppSettings();
    bool isSuccess = false;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['data'] != null) {
        dynamic data = myMap["data"];
        dynamic admin = myMap["admin"];
        if (data != null && admin != null) {
          SettingsModel appSettingsInfo = SettingsModel.fromJson(data);

          SupportModel supportModelInfo = SupportModel.fromJson(admin);

          parser.saveBasicInfo(
              supportModelInfo.email,
              appSettingsInfo.name,
              supportModelInfo.firstName,
              supportModelInfo.id,
              supportModelInfo.mobile);
          isSuccess = true;
        } else {
          isSuccess = false;
        }
      }
    } else {
      ApiChecker.checkApi(response);
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  String getLanguageCode() {
    return parser.getLanguagesCode();
  }
}
