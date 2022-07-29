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
import 'package:user/app/controller/winner_controller.dart';
import 'package:user/app/util/theme.dart';

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({Key? key}) : super(key: key);

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WinnerController>(builder: (value) {
      return Scaffold(
        appBar: AppBar(
          title: Text(value.name, style: ThemeProvider.titleStyle),
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
            : value.apiCalled == true && value.topperList.isEmpty
                ? const Center(
                    child: Text('No Data Found',
                        style: TextStyle(fontSize: 14, fontFamily: 'bold')),
                  )
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        children:
                            List.generate(value.topperList.length, (index) {
                          return Container(
                            color: ThemeProvider.whiteColor,
                            margin: const EdgeInsets.only(bottom: 5, top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('Student Name : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${value.topperList[index].user!.firstName} ${value.topperList[index].user!.lastName}',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('Enrollment : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${value.topperList[index].user!.enroll}',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('Gained Marks : '.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'bold')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${value.topperList[index].gained}/${value.topperList[index].total}',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.green,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            (index + 1).toString(),
                                            style: const TextStyle(
                                              color: ThemeProvider.appColor,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  )),
      );
    });
  }
}
