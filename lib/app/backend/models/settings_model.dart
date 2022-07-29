/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
class SettingsModel {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? fcmToken;
  int? status;
  String? extraField;

  SettingsModel(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.address,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.fcmToken,
      this.status,
      this.extraField});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    fcmToken = json['fcm_token'];
    status = json['status'];
    extraField = json['extra_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['country'] = country;
    data['fcm_token'] = fcmToken;
    data['status'] = status;
    data['extra_field'] = extraField;
    return data;
  }
}
