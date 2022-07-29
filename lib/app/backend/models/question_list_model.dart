/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
class QuestionListModel {
  int? id;
  bool? haveImage;
  String? imageURL;
  String? minute;
  List<Options>? options;
  String? qustion;
  String? secounds;
  late int timeout;
  late String answerKey;
  QuestionListModel(
      {this.id,
      this.haveImage,
      this.imageURL,
      this.minute,
      this.options,
      this.qustion,
      this.secounds,
      this.timeout = 0,
      this.answerKey = ''});

  QuestionListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    haveImage = json['haveImage'];
    imageURL = json['imageURL'];
    minute = json['minute'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    qustion = json['qustion'];
    secounds = json['secounds'];
    timeout = Duration(
            minutes: int.parse(json['minute']),
            seconds: int.parse(json['secounds']))
        .inSeconds;
    answerKey = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['haveImage'] = haveImage;
    data['imageURL'] = imageURL;
    data['minute'] = minute;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['qustion'] = qustion;
    data['secounds'] = secounds;
    data['timeout'] = timeout;
    data['answerKey'] = answerKey;
    return data;
  }
}

class Options {
  String? answer;

  Options({this.answer});

  Options.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer'] = answer;
    return data;
  }
}
