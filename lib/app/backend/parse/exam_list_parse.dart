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

class ExamListParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ExamListParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMyExams(int subjectId) async {
    return apiService.postPrivate(
        AppConstants.getMyExams,
        {
          "study_id": sharedPreferencesManager.getInt('studyId'),
          "term_id": sharedPreferencesManager.getInt('termId'),
          "subject_id": subjectId,
          "uid": sharedPreferencesManager.getString('uid')
        },
        sharedPreferencesManager.getString('token') ?? '');
  }
}
