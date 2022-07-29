/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/backend/binding/account_binding.dart';
import 'package:user/app/backend/binding/contact_binding.dart';
import 'package:user/app/backend/binding/edit_profile_binding.dart';
import 'package:user/app/backend/binding/exam_list_binding.dart';
import 'package:user/app/backend/binding/exam_paper_binding.dart';
import 'package:user/app/backend/binding/exam_stats_binding.dart';
import 'package:user/app/backend/binding/home_binding.dart';
import 'package:user/app/backend/binding/language_binding.dart';
import 'package:user/app/backend/binding/learning_binding.dart';
import 'package:user/app/backend/binding/learning_details_binding.dart';
import 'package:user/app/backend/binding/learning_list_binding.dart';
import 'package:user/app/backend/binding/login_binding.dart';
import 'package:user/app/backend/binding/pages_binding.dart';
import 'package:user/app/backend/binding/register_binding.dart';
import 'package:user/app/backend/binding/reset_password_binding.dart';
import 'package:user/app/backend/binding/result_binding.dart';
import 'package:user/app/backend/binding/splash_binding.dart';
import 'package:user/app/backend/binding/tabs_binding.dart';
import 'package:user/app/backend/binding/winner_binding.dart';
import 'package:user/app/view/account.dart';
import 'package:user/app/view/app_pages.dart';
import 'package:user/app/view/contact.dart';
import 'package:user/app/view/edit_profile.dart';
import 'package:user/app/view/error.dart';
import 'package:user/app/view/exam_list.dart';
import 'package:user/app/view/exam_paper.dart';
import 'package:user/app/view/exam_stats.dart';
import 'package:user/app/view/home.dart';
import 'package:user/app/view/languages.dart';
import 'package:user/app/view/learning.dart';
import 'package:user/app/view/learning_details.dart';
import 'package:user/app/view/learning_list.dart';
import 'package:user/app/view/login.dart';
import 'package:user/app/view/register.dart';
import 'package:user/app/view/reset.dart';
import 'package:user/app/view/result.dart';
import 'package:user/app/view/splash.dart';
import 'package:user/app/view/tabs.dart';
import 'package:user/app/view/winner.dart';

class AppRouter {
  static const String initialRoutes = '/';
  static const String homeRoutes = '/home';
  static const String loginRoutes = '/login';
  static const String registerRoutes = '/register';
  static const String examListRoutes = '/exam_list';
  static const String examPaperRoutes = '/exam_papers';
  static const String resultRoutes = '/result';
  static const String examStatsRoutes = '/exam_stats';
  static const String tabsRoutes = '/tabs';
  static const String learningRoutes = '/learning';
  static const String accountRoutes = '/account';
  static const String learningListRoutes = '/learning_list';
  static const String learningDetailsRoutes = '/learning_details';
  static const String winnerRoutes = '/winners';
  static const String appPagesRoutes = '/app_pages';
  static const String editProfileRoutes = '/edit_profile';
  static const String contactRoutes = '/contactus';
  static const String errorRoutes = '/error';
  static const String languagesRoutes = '/languages';
  static const String resetPasswordRoutes = '/reset_password';

  static String getInitialRoute() => initialRoutes;
  static String getHomeRoutes() => homeRoutes;
  static String getLoginRoutes() => loginRoutes;
  static String getRegisterRoutes() => registerRoutes;
  static String getExamListRoutes() => examListRoutes;
  static String getExamPapersRoutes() => examPaperRoutes;
  static String getResultRoutes() => resultRoutes;
  static String getExamStatsRoutes() => examStatsRoutes;
  static String getTabsRoutes() => tabsRoutes;
  static String getLearningRoutes() => learningRoutes;
  static String getAccountRoutes() => accountRoutes;
  static String getLearningListRoutes() => learningListRoutes;
  static String getLearningDetailsRoutes() => learningDetailsRoutes;
  static String getWinnersRoutes() => winnerRoutes;
  static String getAppPagesRoute() => appPagesRoutes;
  static String getEditProfileRoutes() => editProfileRoutes;
  static String getContactRoutes() => contactRoutes;
  static String getErrorRoute() => errorRoutes;
  static String getLanguagesRoutes() => languagesRoutes;
  static String getResetPasswordRoutes() => resetPasswordRoutes;

  static List<GetPage> routes = [
    GetPage(
        name: initialRoutes,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: homeRoutes,
        page: () => const HomeScreen(),
        binding: HomeBindings()),
    GetPage(
        name: loginRoutes,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: registerRoutes,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: examListRoutes,
        page: () => const ExamListScreen(),
        binding: ExamListBindings()),
    GetPage(
        name: examPaperRoutes,
        page: () => const ExamPaperScreen(),
        binding: ExamPaperBindings()),
    GetPage(
        name: resultRoutes,
        page: () => const ResultScreen(),
        binding: ResultBinding()),
    GetPage(
        name: examStatsRoutes,
        page: () => const ExamStatScreen(),
        binding: ExamStatsBinding()),
    GetPage(
        name: tabsRoutes,
        page: () => const TabScreen(),
        binding: TabsBinding()),
    GetPage(
        name: learningRoutes,
        page: () => const LearningScreen(),
        binding: LearningBinding()),
    GetPage(
        name: accountRoutes,
        page: () => const AccountScreen(),
        binding: AccountBindings()),
    GetPage(
        name: learningListRoutes,
        page: () => const LearningListScreen(),
        binding: LearningListBindings()),
    GetPage(
        name: learningDetailsRoutes,
        page: () => const LearningDetailScreen(),
        binding: LearningDetailsBindings()),
    GetPage(
        name: winnerRoutes,
        page: () => const WinnerScreen(),
        binding: WinnerBinding()),
    GetPage(
        name: appPagesRoutes,
        page: () => const AppPageScreen(),
        binding: AppPagesBinding()),
    GetPage(
        name: editProfileRoutes,
        page: () => const EditProfileScreen(),
        binding: EditProfileBindings()),
    GetPage(
        name: contactRoutes,
        page: () => const ContactScreen(),
        binding: ContactBindings()),
    GetPage(name: errorRoutes, page: () => const ErrorScreen()),
    GetPage(
        name: languagesRoutes,
        page: () => const LanguageScreen(),
        binding: LanguageBinding()),
    GetPage(
        name: resetPasswordRoutes,
        page: () => const ResetPasswordScreen(),
        binding: ResetPasswordBinding())
  ];
}
