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
import 'package:skeletons/skeletons.dart';
import 'package:user/app/controller/exam_list_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({Key? key}) : super(key: key);

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamListController>(builder: (value) {
      return Scaffold(
          appBar: AppBar(
            title: Text(value.subjectName.toString(),
                style: ThemeProvider.titleStyle),
            backgroundColor: ThemeProvider.appColor,
            automaticallyImplyLeading: true,
            elevation: 0.0,
            centerTitle: false,
          ),
          body: value.apiCalled == false
              ? SkeletonListView(
                  item: SkeletonListTile(
                    verticalSpacing: 12,
                    leadingStyle: const SkeletonAvatarStyle(
                        width: 64, height: 64, shape: BoxShape.rectangle),
                    titleStyle: SkeletonLineStyle(
                        height: 16,
                        minLength: 200,
                        randomLength: true,
                        borderRadius: BorderRadius.circular(12)),
                    subtitleStyle: SkeletonLineStyle(
                        height: 12,
                        maxLength: 200,
                        randomLength: true,
                        borderRadius: BorderRadius.circular(12)),
                    hasSubtitle: true,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        children: List.generate(value.examList.length, (index) {
                          return Container(
                            color: ThemeProvider.whiteColor,
                            margin: const EdgeInsets.only(bottom: 5, top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                          height: 70,
                                          width: 70,
                                          child: FadeInImage(
                                            image: NetworkImage(
                                                '${Environments.apiBaseURL}storage/images/${value.examList[index].cover}'),
                                            placeholder: const AssetImage(
                                                "assets/images/placeholder.jpeg"),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/images/notfound.png',
                                                  fit: BoxFit.fitWidth);
                                            },
                                            fit: BoxFit.fitWidth,
                                          )),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Exam Name : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.examList[index].name!
                                                          .length >
                                                      20
                                                  ? '${value.examList[index].name!.substring(0, 20)}...'
                                                  : value.examList[index].name
                                                      .toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'bold'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Exam Date : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${value.examList[index].startTime} to ${value.examList[index].endTime}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'semi-bold'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Total Marks : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.examList[index]
                                                  .totalQuestions
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'semi-bold'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Passing Marks : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.examList[index].passingMarks
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'semi-bold'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Negative Marks : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value
                                                  .examList[index].negativeMarks
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'semi-bold'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Examiner Name : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.examList[index].examinerName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'semi-bold'),
                                            ),
                                          ],
                                        ),
                                        value.examList[index].attempted == true
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Your Exam Result : '.tr,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'bold')),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    value.examList[index].stats!
                                                                .result ==
                                                            1
                                                        ? 'Passed'.tr
                                                        : 'Failed'.tr,
                                                    style: TextStyle(
                                                        color: value
                                                                    .examList[
                                                                        index]
                                                                    .stats!
                                                                    .result ==
                                                                1
                                                            ? ThemeProvider
                                                                .appColor
                                                            : ThemeProvider
                                                                .redColor,
                                                        fontSize: 12,
                                                        fontFamily: 'bold'),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                        value.examList[index].attempted == true
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Your Marks : '.tr,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'bold')),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '${value.examList[index].stats!.gained} / ${value.examList[index].stats!.total}',
                                                    style: TextStyle(
                                                        color: value
                                                                    .examList[
                                                                        index]
                                                                    .stats!
                                                                    .result ==
                                                                1
                                                            ? ThemeProvider
                                                                .appColor
                                                            : ThemeProvider
                                                                .redColor,
                                                        fontSize: 12,
                                                        fontFamily: 'bold'),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                      ],
                                    )),
                                    const SizedBox(width: 16),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 40,
                                      child: value.examList[index].attempted ==
                                              false
                                          ? ElevatedButton(
                                              onPressed: () {
                                                value.onExamPaper(
                                                    value.examList[index].id
                                                        as int,
                                                    value.examList[index].name
                                                        .toString());
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      ThemeProvider.appColor,
                                                  onPrimary: Colors.white,
                                                  elevation: 0,
                                                  textStyle: const TextStyle(
                                                      fontFamily: 'medium',
                                                      letterSpacing: 0.5,
                                                      fontSize: 14)),
                                              child: Text('Start Exam'.tr),
                                            )
                                          : ElevatedButton(
                                              onPressed: () {
                                                value.onExamStats(
                                                    value.examList[index].id
                                                        as int,
                                                    value.examList[index].name
                                                        .toString());
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      ThemeProvider.appColor,
                                                  onPrimary: Colors.white,
                                                  elevation: 0,
                                                  textStyle: const TextStyle(
                                                      fontFamily: 'medium',
                                                      letterSpacing: 0.5,
                                                      fontSize: 14)),
                                              child: Text('View Stats'.tr),
                                            ),
                                    ),
                                    value.examList[index].attempted == true
                                        ? IconButton(
                                            onPressed: () {
                                              value.onWinnerRoutes(
                                                  value.examList[index].id
                                                      as int,
                                                  value.examList[index].name
                                                      .toString());
                                            },
                                            icon: const Icon(
                                                Icons.workspace_premium_sharp))
                                        : const SizedBox()
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ));
    });
  }
}
