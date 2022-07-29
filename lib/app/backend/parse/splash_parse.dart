/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:user/app/util/constant.dart';

class SplashParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  SplashParser(
      {required this.sharedPreferencesManager, required this.apiService});

  bool showLoggedIn() {
    return sharedPreferencesManager.getBool('loggedIn');
  }

  Future<bool> initAppSettings() {
    return Future.value(true);
  }

  Future<Response> getAppSettings() async {
    Response response = await apiService.getPublic(AppConstants.appSettings);
    return response;
  }

  void removeCreds() {
    sharedPreferencesManager.clearKey('token');
    sharedPreferencesManager.clearKey('uid');
    sharedPreferencesManager.clearKey('firstName');
    sharedPreferencesManager.clearKey('lastName');
    sharedPreferencesManager.clearKey('email');
    sharedPreferencesManager.clearKey('cover');
    sharedPreferencesManager.clearKey('phone');
    sharedPreferencesManager.clearKey('termId');
    sharedPreferencesManager.clearKey('studyId');
    sharedPreferencesManager.clearKey('loggedIn');
  }

  void saveBasicInfo(var supportEmail, var appName, var supportName,
      var supportId, var supportPhone) {
    sharedPreferencesManager.putString('supportEmail', supportEmail);
    sharedPreferencesManager.putString('appName', appName);
    sharedPreferencesManager.putInt('supportUID', supportId);
    sharedPreferencesManager.putString('supportName', supportName);
    sharedPreferencesManager.putString('supportPhone', supportPhone);
  }

  String getLanguagesCode() {
    return sharedPreferencesManager.getString('language') ?? 'en';
  }

  void saveDeviceToken(String token) {
    sharedPreferencesManager.putString('fcm_token', token);
  }
}
