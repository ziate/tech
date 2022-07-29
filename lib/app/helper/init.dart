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
import 'package:user/app/backend/parse/account_parse.dart';
import 'package:user/app/backend/parse/contact_parse.dart';
import 'package:user/app/backend/parse/edit_profile_parse.dart';
import 'package:user/app/backend/parse/exam_list_parse.dart';
import 'package:user/app/backend/parse/exam_paper_parse.dart';
import 'package:user/app/backend/parse/exam_stats_parse.dart';
import 'package:user/app/backend/parse/home_parse.dart';
import 'package:user/app/backend/parse/language_parse.dart';
import 'package:user/app/backend/parse/learning_details_parse.dart';
import 'package:user/app/backend/parse/learning_list_parse.dart';
import 'package:user/app/backend/parse/learning_parser.dart';
import 'package:user/app/backend/parse/login_parse.dart';
import 'package:user/app/backend/parse/pages_parse.dart';
import 'package:user/app/backend/parse/register_parser.dart';
import 'package:user/app/backend/parse/reset_password_parse.dart';
import 'package:user/app/backend/parse/result_parse.dart';
import 'package:user/app/backend/parse/splash_parse.dart';
import 'package:user/app/backend/parse/tabs_parser.dart';
import 'package:user/app/backend/parse/winner_parse.dart';
import 'package:user/app/controller/home_controller.dart';
import 'package:user/app/controller/learning_controller.dart';
import 'package:user/app/controller/splash_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final sharedPref = await SharedPreferences.getInstance();
    Get.put(
      SharedPreferencesManager(sharedPreferences: sharedPref),
      permanent: true,
    );

    Get.lazyPut(() => ApiService(appBaseUrl: Environments.apiBaseURL));

    // Parser LazyLoad
    Get.lazyPut(
        () => HomeParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => LoginParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => SplashParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => RegisterParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ExamListParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ExamPaperParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ResultParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ExamStatsParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => TabsParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => LearningParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => AccountParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => LearningListParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => LearningDetailsParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => WinnerParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => AppPagesParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => EditProfileParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ContactParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => LanguagesParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ResetPasswordParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);

    Get.lazyPut(() => HomeController(parser: Get.find()), fenix: true);

    Get.lazyPut(() => LearningController(parser: Get.find()), fenix: true);

    Get.lazyPut(() => SplashController(parser: Get.find()), fenix: true);
  }
}
