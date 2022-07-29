/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/api/handler.dart';
import 'package:user/app/backend/models/my_answer_model.dart';
import 'package:user/app/backend/models/question_model.dart';
import 'package:user/app/backend/parse/exam_paper_parse.dart';
import 'package:user/app/controller/result_controller.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/theme.dart';
import 'package:user/app/util/toast.dart';

class ExamPaperController extends GetxController implements GetxService {
  final ExamPaperParser parser;
  int examId = 0;
  String name = '';
  bool apiCalled = false;
  QuestionModel _questionData = QuestionModel();
  QuestionModel get questionData => _questionData;
  List<MyAnswerModel> _myAnswerList = <MyAnswerModel>[];
  List<MyAnswerModel> get myAnswerList => _myAnswerList;
  int currentQuestionIndex = 1;

  final ScrollController scrollQuestionNumberController = ScrollController();
  final ScrollController scrollQuestionController = ScrollController();
  final PageController questionPageController = PageController();

  List<GlobalKey> questionsKeys = <GlobalKey>[];

  bool isEnd = false;

  List<String> alphaIndex = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  late Timer _timer;
  int timeoutSeconds = 0;
  ExamPaperController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    examId = Get.arguments[0];
    name = Get.arguments[1];
    // examId = 2;
    // name = 'test';
    getQuestion();
  }

  void onPageIndexChanged(int index) {
    currentQuestionIndex = index;
    debugPrint(currentQuestionIndex.toString());
    if ((_questionData.questionsList!.length - 1) == currentQuestionIndex) {
      isEnd = true;
    }
    Scrollable.ensureVisible(questionsKeys[index].currentContext!);
    debugPrint('isEnd$isEnd');
    update();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timeoutSeconds == 0) {
          timer.cancel();
          _questionData.questionsList![currentQuestionIndex - 1].answerKey =
              'NA';
          showToast('Timeout');
          if (isEnd == false) {
            onNextQuestion();
          } else {
            debugPrint(_questionData
                .questionsList![currentQuestionIndex - 1].qustion
                .toString());
            getResults();
          }

          update();
        } else {
          timeoutSeconds--;
          update();
        }
      },
    );
  }

  Future<void> getQuestion() async {
    Response response = await parser.getQuestion(examId);
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      dynamic body = myMap["data"];
      _questionData = QuestionModel();
      QuestionModel data = QuestionModel.fromJson(body);
      _questionData = data;
      // ignore: unused_local_variable
      for (var element in _questionData.questionsList!) {
        questionsKeys.add(GlobalKey());
      }
      if (_questionData.questionsList!.isNotEmpty) {
        timeoutSeconds = _questionData.questionsList![0].timeout;
        startTimer();
      }
      if ((_questionData.questionsList!.length - 1) == currentQuestionIndex) {
        isEnd = true;
        update();
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  String getAplphaIndex(int index) {
    return alphaIndex[index].toString();
  }

  void saveAnswer(int index, int anwerIndex) {
    _questionData.questionsList![index].answerKey = anwerIndex.toString();
    debugPrint(_questionData.questionsList![index].answerKey);
    update();
  }

  void onNextQuestion() {
    debugPrint('$currentQuestionIndex-${_questionData.questionsList!.length}');
    if ((_questionData.questionsList!.length - 1) == currentQuestionIndex) {
      isEnd = true;
      update();
    }
    debugPrint(
        'saved Answer${_questionData.questionsList![(currentQuestionIndex - 1)].answerKey}');
    if (_questionData.questionsList![(currentQuestionIndex - 1)].answerKey !=
        '') {
      debugPrint('go to next question');
      _timer.cancel();
      timeoutSeconds =
          _questionData.questionsList![currentQuestionIndex].timeout;
      startTimer();
      questionPageController
          .animateToPage(currentQuestionIndex,
              duration: const Duration(milliseconds: 400), curve: Curves.easeIn)
          .then((value) => {currentQuestionIndex = currentQuestionIndex + 1});

      update();
    } else {
      showToast('Please select answer');
    }
  }

  void getResults() {
    _timer.cancel();
    debugPrint('onSubmit');
    _myAnswerList = [];
    for (var element in _questionData.questionsList!) {
      debugPrint(element.answerKey);
      var param = {"id": element.id, "answer": element.answerKey};
      MyAnswerModel data = MyAnswerModel.fromJson(param);
      _myAnswerList.add(data);
    }
    update();
    submitExamPaper();
  }

  Future<void> submitExamPaper() async {
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
                  "Getting Results".tr,
                  style: const TextStyle(fontFamily: 'bold'),
                )),
              ],
            )
          ],
        ),
        barrierDismissible: false);
    Response response =
        await parser.getMyResults(examId, jsonEncode(myAnswerList));
    Get.back();
    debugPrint(response.bodyString);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap['result'].toString());
      debugPrint(double.parse(myMap['total'].toString()).toString());
      Get.delete<ResultController>(force: true);
      Get.offNamed(AppRouter.getResultRoutes(), arguments: [
        myMap['result'] == 1 ? true : false,
        examId,
        double.parse(myMap['total'].toString()),
        double.parse(questionData.questionsList!.length.toString())
      ]);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void quiteExam() {
    for (var element in _questionData.questionsList!) {
      if (element.answerKey == '') {
        element.answerKey = 'NA';
      }
    }
    update();
    getResults();
  }
}
