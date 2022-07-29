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

class LearningListParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LearningListParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getList(int subjectId) async {
    return apiService.postPrivate(
        AppConstants.myLearningList,
        {
          "study_id": sharedPreferencesManager.getInt('studyId'),
          "term_id": sharedPreferencesManager.getInt('termId'),
          "subject_id": subjectId,
        },
        sharedPreferencesManager.getString('token') ?? '');
  }
}
