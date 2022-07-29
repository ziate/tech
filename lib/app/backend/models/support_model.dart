/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
class SupportModel {
  int? id;
  String? enroll;
  int? termId;
  int? studyId;
  String? email;
  String? firstName;
  String? lastName;
  int? gender;
  int? type;
  String? cover;
  String? countryCode;
  String? mobile;
  int? verified;
  String? fcmToken;
  String? others;
  int? status;
  String? extraField;
  String? createdAt;
  String? updatedAt;

  SupportModel(
      {this.id,
      this.enroll,
      this.termId,
      this.studyId,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.type,
      this.cover,
      this.countryCode,
      this.mobile,
      this.verified,
      this.fcmToken,
      this.others,
      this.status,
      this.extraField,
      this.createdAt,
      this.updatedAt});

  SupportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enroll = json['enroll'];
    termId = json['term_id'];
    studyId = json['study_id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    type = json['type'];
    cover = json['cover'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    verified = json['verified'];
    fcmToken = json['fcm_token'];
    others = json['others'];
    status = json['status'];
    extraField = json['extra_field'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enroll'] = enroll;
    data['term_id'] = termId;
    data['study_id'] = studyId;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['type'] = type;
    data['cover'] = cover;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['verified'] = verified;
    data['fcm_token'] = fcmToken;
    data['others'] = others;
    data['status'] = status;
    data['extra_field'] = extraField;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
