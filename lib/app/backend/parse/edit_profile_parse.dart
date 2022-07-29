/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:image_picker/image_picker.dart';
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:user/app/util/constant.dart';

class EditProfileParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  EditProfileParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getStudies() async {
    return apiService.getPublic(AppConstants.getStudies);
  }

  Future<Response> getTermsByStudiesId(int id) async {
    return apiService.postPublic(AppConstants.getTermsByStudies, {"id": id});
  }

  Future<Response> getUserProfile() async {
    return apiService.postPrivate(
        AppConstants.getProfile,
        {"id": sharedPreferencesManager.getString('uid')},
        sharedPreferencesManager.getString('token') ?? '');
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  Future<Response> updateProfile(var body) async {
    return apiService.postPrivate(AppConstants.updateProfile, body,
        sharedPreferencesManager.getString('token') ?? '');
  }

  Future<Response> uploadImage(XFile data) async {
    return await apiService
        .uploadFiles(AppConstants.uploadImage, [MultipartBody('image', data)]);
  }

  void saveInfo(String firstName, String lastName, String cover, String phone,
      int termId, int studyId) {
    sharedPreferencesManager.putString('firstName', firstName);
    sharedPreferencesManager.putString('lastName', lastName);
    sharedPreferencesManager.putString('cover', cover);
    sharedPreferencesManager.putString('phone', phone);
    sharedPreferencesManager.putInt('termId', termId);
    sharedPreferencesManager.putInt('studyId', studyId);
  }
}
