/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  int? type;
  int? status;
  String? mobile;
  String? cover;
  String? countryCode;
  int? gender;
  String? enroll;
  int? termId;
  int? studyId;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserModel(
      {this.email,
      this.firstName,
      this.lastName,
      this.type,
      this.status,
      this.mobile,
      this.cover,
      this.countryCode,
      this.gender,
      this.enroll,
      this.termId,
      this.studyId,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    type = json['type'];
    status = json['status'];
    mobile = json['mobile'];
    cover = json['cover'];
    countryCode = json['country_code'];
    gender = json['gender'];
    enroll = json['enroll'];
    termId = json['term_id'];
    studyId = json['study_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['type'] = type;
    data['status'] = status;
    data['mobile'] = mobile;
    data['cover'] = cover;
    data['country_code'] = countryCode;
    data['gender'] = gender;
    data['enroll'] = enroll;
    data['term_id'] = termId;
    data['study_id'] = studyId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
