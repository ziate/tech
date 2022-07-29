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
import 'package:user/app/controller/exam_stats_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class ExamStatScreen extends StatefulWidget {
  const ExamStatScreen({Key? key}) : super(key: key);

  @override
  State<ExamStatScreen> createState() => _ExamStatScreenState();
}

class _ExamStatScreenState extends State<ExamStatScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamStatsController>(builder: (value) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Exam Stats'.tr, style: ThemeProvider.titleStyle),
          backgroundColor: ThemeProvider.appColor,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: value.apiCalled == false
            ? const Center(
                child: CircularProgressIndicator(
                  color: ThemeProvider.appColor,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                children: List.generate(
                    value.questionData.questionsList!.length,
                    (index) => SingleChildScrollView(
                          controller: value.scrollQuestionController,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      (optionIndex) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: value
                                                          .stats
                                                          .realAnwer![index]
                                                          .answer
                                                          .toString() ==
                                                      optionIndex.toString()
                                                  ? ThemeProvider.correctAnswer
                                                  : value
                                                              .stats
                                                              .userAnswer![
                                                                  index]
                                                              .answer ==
                                                          optionIndex.toString()
                                                      ? value
                                                                  .stats
                                                                  .realAnwer![
                                                                      index]
                                                                  .answer ==
                                                              value
                                                                  .stats
                                                                  .userAnswer![
                                                                      index]
                                                                  .answer
                                                          ? ThemeProvider
                                                              .correctAnswer
                                                          : ThemeProvider
                                                              .redColor
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
                                                                    .stats
                                                                    .realAnwer![
                                                                        index]
                                                                    .answer
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.5,
                                                  child: Text(
                                                    value
                                                        .questionData
                                                        .questionsList![index]
                                                        .options![optionIndex]
                                                        .answer
                                                        .toString(),
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                        color: value
                                                                    .stats
                                                                    .realAnwer![
                                                                        index]
                                                                    .answer
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
                                          )),
                                )
                              ],
                            ),
                          ),
                        )),
              )),
      );
    });
  }
}
