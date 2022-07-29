/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/api/handler.dart';
import 'package:user/app/backend/models/studies_model.dart';
import 'package:user/app/backend/models/terms_model.dart';
import 'package:user/app/backend/models/user_model.dart';
import 'package:user/app/backend/parse/register_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/app/controller/home_controller.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/theme.dart';
import 'package:user/app/util/toast.dart';

class RegisterController extends GetxController implements GetxService {
  final RegisterParser parser;
  String cover = '';
  bool apiCalled = false;
  RxBool passwordVisible = false.obs;
  List<StudiesModel> _studiesList = <StudiesModel>[];
  List<StudiesModel> get studiesList => _studiesList;
  bool haveStudies = false;

  List<TermsModel> _termsList = <TermsModel>[];
  List<TermsModel> get termsList => _termsList;
  bool haveTerms = false;

  StudiesModel _selectedStudies = StudiesModel();
  StudiesModel get selectedStudies => _selectedStudies;

  TermsModel _selectedTerms = TermsModel();
  TermsModel get selectedTerms => _selectedTerms;
  String countryCode = '+91';
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobile = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final enrollment = TextEditingController();
  RegisterController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    getStudies();
  }

  Future<void> getStudies() async {
    Response response = await parser.getStudies();
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _studiesList = [];
      body.forEach((data) {
        StudiesModel datas = StudiesModel.fromJson(data);
        _studiesList.add(datas);
      });
      if (studiesList.isNotEmpty) {
        haveStudies = true;
        _selectedStudies = _studiesList[0];
        getTermsByStudies();
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getTermsByStudies() async {
    Response response =
        await parser.getTermsByStudiesId(selectedStudies.id as int);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _termsList = [];
      _selectedTerms = TermsModel();
      body.forEach((data) {
        TermsModel datas = TermsModel.fromJson(data);
        _termsList.add(datas);
      });
      if (_termsList.isNotEmpty) {
        haveTerms = true;
        _selectedTerms = _termsList[0];
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void selectFromGallery(String kind) async {
    debugPrint(kind);
    final pickedFile = await ImagePicker().pickImage(
        source: kind == 'gallery' ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 25);
    debugPrint(pickedFile.toString());
    if (pickedFile != null) {
      Get.dialog(
          SimpleDialog(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const CircularProgressIndicator(
                    color: ThemeProvider.appColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                      child: Text(
                    "Please wait".tr,
                    style: const TextStyle(fontFamily: 'bold'),
                  )),
                ],
              )
            ],
          ),
          barrierDismissible: false);
      Response response = await parser.uploadImage(pickedFile);
      Get.back();
      if (response.statusCode == 200) {
        if (response.body['data'] != null && response.body['data'] != '') {
          dynamic body = response.body["data"];
          if (body['image_name'] != null && body['image_name'] != '') {
            cover = body['image_name'];
            debugPrint(cover);
            update();
          }
        }
      } else {
        ApiChecker.checkApi(response);
      }
    }
  }

  void saveCountryCode(String code) {
    debugPrint(code);
    countryCode = '+$code';
    update();
  }

  void onStudiesChanged(StudiesModel studies) {
    haveTerms = false;
    _selectedStudies = studies;
    _selectedTerms = TermsModel();
    getTermsByStudies();
    update();
  }

  void onTermsChanged(TermsModel terms) {
    _selectedTerms = terms;
    haveTerms = true;
    update();
  }

  void togglePassword() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }

  Future<void> register() async {
    if (firstName.text == '' ||
        emailAddress.text == '' ||
        password.text == '' ||
        mobile.text == '' ||
        lastName.text == '' ||
        enrollment.text == '' ||
        haveStudies == false ||
        haveTerms == false ||
        cover == '') {
      showToast('All fields are required');
      return;
    }

    if (!GetUtils.isEmail(emailAddress.text)) {
      showToast('Email is not valid');
      return;
    }

    var param = {
      "email": emailAddress.text,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "mobile": mobile.text,
      "country_code": countryCode,
      "password": password.text,
      "enroll": enrollment.text,
      "term_id": selectedTerms.id,
      "study_id": selectedStudies.id,
      "cover": cover,
      'fcm_token': parser.getFcmToken(),
    };

    Get.dialog(
        SimpleDialog(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const CircularProgressIndicator(
                  color: ThemeProvider.appColor,
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                    child: Text(
                  "Please wait".tr,
                  style: const TextStyle(fontFamily: 'bold'),
                )),
              ],
            )
          ],
        ),
        barrierDismissible: false);

    Response response = await parser.createAccount(param);
    Get.back();
    debugPrint(response.bodyString);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['user'] != '' &&
          myMap['token'] != '' &&
          myMap['user']['type'] == 1) {
        if (myMap['user']['status'] == 1) {
          UserModel data = UserModel.fromJson(myMap['user']);
          parser.saveInfo(
              myMap['token'],
              data.id.toString(),
              data.firstName.toString(),
              data.lastName.toString(),
              data.email.toString(),
              data.cover.toString(),
              data.mobile.toString(),
              data.termId as int,
              data.studyId as int);

          Get.delete<HomeController>(force: true);
          Get.offNamed(AppRouter.getTabsRoutes());
        } else {
          showToast('Your account is suspended');
        }
      } else {
        showToast('Something went wrong while signup');
      }
      update();
    } else if (response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['success'] == false) {
        showToast(myMap['message']);
      } else {
        showToast('Something went wrong');
      }
      update();
    } else {
      ApiChecker.checkApi(response);
      update();
    }
  }
}
