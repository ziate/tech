/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:user/app/util/constant.dart';

class ExamPaperParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ExamPaperParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getQuestion(int id) async {
    return apiService.postPrivate(AppConstants.getQuestions, {"id": id},
        sharedPreferencesManager.getString('token') ?? '');
  }

  Future<Response> getMyResults(int id, String answer) async {
    return apiService.postPrivate(
        AppConstants.getMyResult,
        {
          "id": id,
          "keys": answer,
          "uid": sharedPreferencesManager.getString('uid')
        },
        sharedPreferencesManager.getString('token') ?? '');
  }
}
