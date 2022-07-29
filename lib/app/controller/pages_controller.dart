/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:user/app/backend/api/handler.dart';
import 'package:user/app/backend/parse/pages_parse.dart';

class AppPagesController extends GetxController implements GetxService {
  final AppPagesParser parser;
  String pageName = '';
  String pageId = '';
  String content = '';
  bool apiCalled = false;
  AppPagesController({required this.parser});

  @override
  void onInit() async {
    super.onInit();
    var name = Get.arguments[0];
    var dbPageId = Get.arguments[1];
    pageName = name;
    pageId = dbPageId;
    update();
    getContent();
  }

  Future<void> getContent() async {
    Response response = await parser.getContentById(pageId);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      if (body['content'] != '' && body['content'] != null) {
        content = body['content'];
      }
      update();
    } else {
      ApiChecker.checkApi(response);
      update();
    }
  }
}
