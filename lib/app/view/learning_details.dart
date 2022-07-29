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
import 'package:user/app/controller/learning_details_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class LearningDetailScreen extends StatefulWidget {
  const LearningDetailScreen({Key? key}) : super(key: key);

  @override
  State<LearningDetailScreen> createState() => _LearningDetailScreenState();
}

class _LearningDetailScreenState extends State<LearningDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningDetailsController>(builder: (value) {
      return Scaffold(
        appBar: AppBar(
          title: Text(value.name, style: ThemeProvider.titleStyle),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    value.details.content!.length,
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
                                  '${index + 1}. ${value.details.content![index].qustion}',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontFamily: 'bold', fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                value.details.content![index].haveImage == true
                                    ? Text('Follow Image Question'.tr,
                                        style: const TextStyle(
                                            fontFamily: 'bold', fontSize: 14))
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 10,
                                ),
                                value.details.content![index].haveImage == true
                                    ? SizedBox(
                                        width: double.infinity,
                                        child: FadeInImage(
                                          image: NetworkImage(
                                              '${Environments.apiBaseURL}storage/images/${value.details.content![index].imageURL}'),
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
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Ans.'.tr +
                                      value.details.content![index].answer
                                          .toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: ThemeProvider.correctAnswer,
                                      fontFamily: 'bold',
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        )),
              )),
      );
    });
  }
}
