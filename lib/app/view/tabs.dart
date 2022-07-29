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
import 'package:user/app/controller/tabs_controller.dart';
import 'package:user/app/util/theme.dart';
import 'package:user/app/view/account.dart';
import 'package:user/app/view/home.dart';
import 'package:user/app/view/learning.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomTabsController>(builder: (value) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: (TabBar(
            labelColor: ThemeProvider.appColor,
            unselectedLabelColor: const Color.fromARGB(255, 185, 196, 207),
            indicatorColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 0),
            labelStyle: const TextStyle(
              fontFamily: 'regular',
              fontSize: 12,
            ),
            onTap: (int index) => value.updateIndex(index),
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined,
                    color: value.currentIndex == 0
                        ? ThemeProvider.appColor
                        : const Color.fromARGB(255, 185, 196, 207)),
                text: 'Home'.tr,
              ),
              Tab(
                icon: Icon(Icons.question_answer_outlined,
                    color: value.currentIndex == 1
                        ? ThemeProvider.appColor
                        : const Color.fromARGB(255, 185, 196, 207)),
                text: 'Study'.tr,
              ),
              Tab(
                icon: Icon(Icons.person_outline,
                    color: value.currentIndex == 2
                        ? ThemeProvider.appColor
                        : const Color.fromARGB(255, 185, 196, 207)),
                text: 'Account'.tr,
              ),
            ],
          )),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [HomeScreen(), LearningScreen(), AccountScreen()],
          ),
        ),
      );
    });
  }
}
