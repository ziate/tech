/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:user/app/backend/models/language_model.dart';
import 'package:user/app/env.dart';

class AppConstants {
  static const String appName = Environments.appName;
  static const String defaultLanguageApp = 'ar';

  // API Routes
  static const String appSettings = 'api/v1/settings/getDefault';
  static const String getStudies = 'api/v1/studies/getActive';
  static const String getTermsByStudies = 'api/v1/terms/getTermsByStudiesId';
  static const String uploadImage = 'api/v1/uploadImage';
  static const String createAccount = 'api/v1/auth/create_account';
  static const String login = 'api/v1/auth/login';
  static const String getMySubjects = 'api/v1/subjects/getMySubjects';
  static const String getMyExams = 'api/v1/exams/getMyExamList';
  static const String getQuestions = 'api/v1/exams/getByExamId';
  static const String getMyResult = 'api/v1/answers/getMyResult';
  static const String getMyExamStats = 'api/v1/attemptExam/getMyStats';
  static const String myLearningList = 'api/v1/learning/getMyLearningList';
  static const String getLearningDetails = 'api/v1/learning/getById';
  static const String getTopperInfo = 'api/v1/exams/getExamStats';
  static const String pageContent = 'api/v1/pages/getContent';
  static const String logout = 'api/v1/auth/logout';
  static const String getProfile = 'api/v1/profile/getByID';
  static const String updateProfile = 'api/v1/profile/update';
  static const String saveaContacts = 'api/v1/contacts/create';
  static const String sendMailToAdmin = 'api/v1/sendMailToAdmin';
  static const String resetWithEmail = 'api/v1/auth/verifyEmailForReset';
  static const String verifyOTPForReset = 'api/v1/otp/verifyOTPReset';
  static const String updatePasswordWithToken =
      'api/v1/password/updateUserPasswordWithEmail';
  // API Routes

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'عربي',
        countryCode: 'AE',
        languageCode: 'ar'),
    LanguageModel(
        imageUrl: '',
        languageName: 'हिन्दी',
        countryCode: 'IN',
        languageCode: 'hi'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Español',
        countryCode: 'De',
        languageCode: 'es'),
  ];
}
