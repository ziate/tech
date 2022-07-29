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
import 'package:user/app/controller/learning_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningController>(builder: (value) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Subjects'.tr,
            style: ThemeProvider.titleStyle,
          ),
          backgroundColor: ThemeProvider.appColor,
        ),
        body: SingleChildScrollView(
            child: value.apiCalled == false
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    mainAxisSpacing: 8,
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 8,
                    childAspectRatio: 80 / 100,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: double.infinity,
                              child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.rectangle,
                                    width: 100,
                                    height: 200),
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      );
                    }),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      mainAxisSpacing: 8,
                      padding: EdgeInsets.zero,
                      crossAxisSpacing: 8,
                      childAspectRatio: 80 / 100,
                      children:
                          List.generate(value.subjectList.length, (index) {
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: (Colors.grey[200])!,
                                    blurRadius: 5.0,
                                    offset: const Offset(
                                      0.0,
                                      0.0,
                                    )),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  value.onStudyList(
                                      value.subjectList[index].id as int,
                                      value.subjectList[index].name.toString());
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    height: 150,
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          '${Environments.apiBaseURL}storage/images/${value.subjectList[index].cover}'),
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
                              const SizedBox(height: 8),
                              Text(
                                value.subjectList[index].name!.length > 15
                                    ? '${value.subjectList[index].name!.toString().substring(0, 15)}...'
                                    : value.subjectList[index].name!.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontFamily: 'bold'),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }),
                    ))),
      );
    });
  }
}
