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

class AccountParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AccountParser(
      {required this.sharedPreferencesManager, required this.apiService});

  String getName() {
    return sharedPreferencesManager.getString('firstName') ??
        '${sharedPreferencesManager.getString('lastName')}';
  }

  String getCover() {
    return sharedPreferencesManager.getString('cover') ?? '';
  }

  String getEmail() {
    return sharedPreferencesManager.getString('email') ?? '';
  }

  Future<Response> logout() async {
    return apiService.postPrivate(AppConstants.logout, {},
        sharedPreferencesManager.getString('token') ?? '');
  }

  void clearAccount() {
    sharedPreferencesManager.clearKey('firstName');
    sharedPreferencesManager.clearKey('lastName');
    sharedPreferencesManager.clearKey('token');
    sharedPreferencesManager.clearKey('uid');
    sharedPreferencesManager.clearKey('email');
    sharedPreferencesManager.clearKey('cover');
    sharedPreferencesManager.clearKey('termId');
    sharedPreferencesManager.clearKey('studyId');
    sharedPreferencesManager.clearKey('loggedIn');
  }
}
