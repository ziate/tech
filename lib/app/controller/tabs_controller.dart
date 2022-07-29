/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/backend/parse/tabs_parser.dart';

class BottomTabsController extends GetxController implements GetxService {
  final TabsParser parser;
  int currentIndex = 0;

  BottomTabsController({required this.parser});

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }
}
