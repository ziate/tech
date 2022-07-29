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
import 'package:user/app/controller/learning_list_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class LearningListScreen extends StatefulWidget {
  const LearningListScreen({Key? key}) : super(key: key);

  @override
  State<LearningListScreen> createState() => _LearningListScreenState();
}

class _LearningListScreenState extends State<LearningListScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningListController>(builder: (value) {
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
                        children: List.generate(value.list.length, (index) {
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
                                      onTap: () {
                                        value.onStudyInfo(
                                            value.list[index].id as int,
                                            value.list[index].name.toString());
                                      },
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: FadeInImage(
                                            image: NetworkImage(
                                                '${Environments.apiBaseURL}storage/images/${value.list[index].cover}'),
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
                                            Text('Learning Name : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.list[index].name!.length >
                                                      20
                                                  ? '${value.list[index].name!.substring(0, 20)}...'
                                                  : value.list[index].name
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
                                            Text('Total Questions : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.list[index].totalQuestions
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
                                            Text('Creator Name : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'semi-bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.list[index].creatorName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'semi-bold'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                    const SizedBox(width: 16),
                                    IconButton(
                                        onPressed: () {
                                          value.onStudyInfo(
                                              value.list[index].id as int,
                                              value.list[index].name
                                                  .toString());
                                        },
                                        icon:
                                            const Icon(Icons.forward_outlined))
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
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
