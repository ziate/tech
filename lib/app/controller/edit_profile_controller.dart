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
import 'package:image_picker/image_picker.dart';
import 'package:user/app/backend/api/handler.dart';
import 'package:user/app/backend/models/studies_model.dart';
import 'package:user/app/backend/models/terms_model.dart';
import 'package:user/app/backend/models/user_model.dart';
import 'package:user/app/backend/parse/edit_profile_parse.dart';
import 'package:user/app/controller/account_controller.dart';
import 'package:user/app/controller/home_controller.dart';
import 'package:user/app/controller/learning_controller.dart';
import 'package:user/app/util/theme.dart';
import 'package:user/app/util/toast.dart';

class EditProfileController extends GetxController implements GetxService {
  final EditProfileParser parser;
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

  int selectedStudiesId = 0;
  int selectedTermId = 0;
  String countryCode = '+91';
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobile = TextEditingController();
  final enrollment = TextEditingController();
  EditProfileController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    Response response = await parser.getUserProfile();
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      UserModel userInfo = UserModel.fromJson(body);
      cover = userInfo.cover.toString();
      firstName.text = userInfo.firstName.toString();
      lastName.text = userInfo.lastName.toString();
      enrollment.text = userInfo.enroll.toString();
      mobile.text = userInfo.mobile.toString();
      countryCode = userInfo.countryCode.toString();
      selectedStudiesId = userInfo.studyId as int;
      selectedTermId = userInfo.termId as int;
      update();
      getStudies();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
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
        _selectedStudies = _studiesList
            .firstWhere((element) => element.id == selectedStudiesId);

        getTermsByStudies(false);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getTermsByStudies(bool isNew) async {
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

      if (_termsList.isNotEmpty && isNew == false) {
        haveTerms = true;
        _selectedTerms =
            _termsList.firstWhere((element) => element.id == selectedTermId);
      } else if (_termsList.isNotEmpty) {
        haveTerms = true;
        _selectedTerms = _termsList[0];
      }
      update();
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
    getTermsByStudies(true);
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
        mobile.text == '' ||
        lastName.text == '' ||
        enrollment.text == '' ||
        haveStudies == false ||
        haveTerms == false ||
        cover == '') {
      showToast('All fields are required');
      return;
    }

    var param = {
      "id": parser.getUID(),
      "first_name": firstName.text,
      "last_name": lastName.text,
      "mobile": mobile.text,
      "country_code": countryCode,
      "enroll": enrollment.text,
      "term_id": selectedTerms.id,
      "study_id": selectedStudies.id,
      "cover": cover
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

    Response response = await parser.updateProfile(param);
    Get.back();
    debugPrint(response.bodyString);
    if (response.statusCode == 200) {
      parser.saveInfo(firstName.text, lastName.text, cover, mobile.text,
          selectedTerms.id as int, selectedStudies.id as int);
      Get.find<AccountController>().updateProfile();
      Get.delete<HomeController>(force: true);
      Get.delete<LearningController>(force: true);
      showToast('Updated');
      update();
      onBack();
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

  void onBack() {
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }
}
