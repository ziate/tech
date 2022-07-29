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

class ResultParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ResultParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
