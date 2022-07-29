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
import 'package:user/app/controller/exam_paper_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class ExamPaperScreen extends StatefulWidget {
  const ExamPaperScreen({Key? key}) : super(key: key);

  @override
  State<ExamPaperScreen> createState() => _ExamPaperScreenState();
}

class _ExamPaperScreenState extends State<ExamPaperScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamPaperController>(builder: (value) {
      return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(20),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/quite.png',
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Are you sure'.tr,
                        style: const TextStyle(
                            fontSize: 24, fontFamily: 'semi-bold'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'to quite this exam? your result will count from current exam'
                            .tr,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: ThemeProvider.greyColor,
                                onPrimary: ThemeProvider.whiteColor,
                                minimumSize: const Size.fromHeight(35),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                'Cancel'.tr,
                                style: const TextStyle(
                                  color: ThemeProvider.whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                value.quiteExam();
                                // Navigator.pop(context, true);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: ThemeProvider.appColor,
                                onPrimary: ThemeProvider.whiteColor,
                                minimumSize: const Size.fromHeight(35),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                'Yes, Quite'.tr,
                                style: const TextStyle(
                                  color: ThemeProvider.whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
          return shouldPop!;
        },
        child: value.apiCalled == false
            ? const Center(
                child: CircularProgressIndicator(color: ThemeProvider.appColor),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(value.name.toString(),
                      style: ThemeProvider.titleStyle),
                  backgroundColor: ThemeProvider.appColor,
                  automaticallyImplyLeading: true,
                  elevation: 0.0,
                  centerTitle: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(30),
                    child: SingleChildScrollView(
                      controller: value.scrollQuestionNumberController,
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  value.questionData.questionsList!.length,
                                  (index) => Container(
                                        width: 50,
                                        height: 20,
                                        margin: const EdgeInsets.only(
                                            right: 5, left: 5),
                                        decoration: BoxDecoration(
                                          color: (value.currentQuestionIndex -
                                                      1) >=
                                                  index
                                              ? ThemeProvider.greyColor
                                              : ThemeProvider.whiteColor,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0)),
                                        ),
                                        child: Text(
                                          key: value.questionsKeys[index],
                                          (index + 1).toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: value.questionPageController,
                  onPageChanged: (int page) {
                    value.onPageIndexChanged(page);
                  },
                  children: List.generate(
                      value.questionData.questionsList!.length,
                      (index) => SingleChildScrollView(
                            controller: value.scrollQuestionController,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 15,
                                        color: ThemeProvider.redColor,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${value.timeoutSeconds} sec',
                                        style: const TextStyle(
                                            color: ThemeProvider.redColor,
                                            fontFamily: 'bold'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    '${index + 1}. ${value.questionData.questionsList![index].qustion}',
                                    style: const TextStyle(
                                        fontFamily: 'bold', fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  value.questionData.questionsList![index]
                                              .haveImage ==
                                          true
                                      ? Text('Follow Image Question'.tr,
                                          style: const TextStyle(
                                              fontFamily: 'bold', fontSize: 14))
                                      : const SizedBox(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  value.questionData.questionsList![index]
                                              .haveImage ==
                                          true
                                      ? SizedBox(
                                          width: double.infinity,
                                          child: FadeInImage(
                                            image: NetworkImage(
                                                '${Environments.apiBaseURL}storage/images/${value.questionData.questionsList![index].imageURL}'),
                                            placeholder: const AssetImage(
                                                "assets/images/placeholder.jpeg"),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/images/notfound.png',
                                                  fit: BoxFit.cover);
                                            },
                                            fit: BoxFit.cover,
                                          ))
                                      : const SizedBox(),
                                  Column(
                                    children: List.generate(
                                        value.questionData.questionsList![index]
                                            .options!.length,
                                        (optionIndex) => InkWell(
                                              onTap: () {
                                                debugPrint(
                                                    optionIndex.toString());
                                                value.saveAnswer(
                                                    index, optionIndex);
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: value
                                                              .questionData
                                                              .questionsList![
                                                                  index]
                                                              .answerKey
                                                              .toString() ==
                                                          optionIndex.toString()
                                                      ? ThemeProvider.greyColor
                                                      : ThemeProvider
                                                          .whiteColor,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        '${value.getAplphaIndex(optionIndex)})',
                                                        style: TextStyle(
                                                            color: value
                                                                        .questionData
                                                                        .questionsList![
                                                                            index]
                                                                        .answerKey
                                                                        .toString() ==
                                                                    optionIndex
                                                                        .toString()
                                                                ? ThemeProvider
                                                                    .whiteColor
                                                                : ThemeProvider
                                                                    .blackColor)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.5,
                                                      child: Text(
                                                        value
                                                            .questionData
                                                            .questionsList![
                                                                index]
                                                            .options![
                                                                optionIndex]
                                                            .answer
                                                            .toString(),
                                                        maxLines: 10,
                                                        style: TextStyle(
                                                            color: value
                                                                        .questionData
                                                                        .questionsList![
                                                                            index]
                                                                        .answerKey
                                                                        .toString() ==
                                                                    optionIndex
                                                                        .toString()
                                                                ? ThemeProvider
                                                                    .whiteColor
                                                                : ThemeProvider
                                                                    .blackColor),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
                bottomNavigationBar: value.apiCalled == true
                    ? Material(
                        color: ThemeProvider.appColor,
                        child: InkWell(
                          onTap: () {
                            if (value.isEnd == false) {
                              value.onNextQuestion();
                            } else {
                              value.getResults();
                            }
                          },
                          child: SizedBox(
                            height: kToolbarHeight,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    value.isEnd == true
                                        ? 'Get Result'.tr
                                        : 'Next Question'.tr,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeProvider.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
      );
    });
  }
}
