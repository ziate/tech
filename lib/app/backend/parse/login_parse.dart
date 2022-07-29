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

class LoginParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LoginParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> login(var body) async {
    return apiService.postPublic(AppConstants.login, body);
  }

  void saveLanguage(String code) {
    sharedPreferencesManager.putString('language', code);
  }

  void saveInfo(String token, String uid, String firstName, String lastName,
      String email, String cover, String phone, int termId, int studyId) {
    sharedPreferencesManager.putString('token', token);
    sharedPreferencesManager.putString('uid', uid);
    sharedPreferencesManager.putString('firstName', firstName);
    sharedPreferencesManager.putString('lastName', lastName);
    sharedPreferencesManager.putString('email', email);
    sharedPreferencesManager.putString('cover', cover);
    sharedPreferencesManager.putString('phone', phone);
    sharedPreferencesManager.putInt('termId', termId);
    sharedPreferencesManager.putInt('studyId', studyId);
    sharedPreferencesManager.putBool('loggedIn', true);
  }

  Future<Response> updateProfile(var body, var token) async {
    return apiService.postPrivate(AppConstants.updateProfile, body, token);
  }

  String getFcmToken() {
    return sharedPreferencesManager.getString('fcm_token') ?? 'NA';
  }
}
