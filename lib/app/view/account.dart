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
import 'package:user/app/controller/account_controller.dart';
import 'package:user/app/controller/contact_controller.dart';
import 'package:user/app/controller/edit_profile_controller.dart';
import 'package:user/app/controller/pages_controller.dart';
import 'package:user/app/controller/reset_password_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/theme.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (value) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180.0),
          child: SafeArea(
            child: AppBar(
              backgroundColor: ThemeProvider.appColor,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: ThemeProvider.appColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'medium',
                                  fontSize: 20),
                            ),
                            Text(
                              value.email,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: FadeInImage(
                              image: NetworkImage(
                                  '${Environments.apiBaseURL}storage/images/${value.cover}'),
                              placeholder: const AssetImage(
                                  "assets/images/placeholder.jpeg"),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/notfound.png',
                                    fit: BoxFit.fitWidth);
                              },
                              fit: BoxFit.fitWidth,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<EditProfileController>(force: true);
                      Get.toNamed(AppRouter.getEditProfileRoutes());
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Edit Profile'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<ResetPasswordController>(force: true);
                      Get.toNamed(AppRouter.getResetPasswordRoutes());
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.password_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Change Password'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<ContactController>(force: true);
                      Get.toNamed(AppRouter.getContactRoutes());
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.perm_contact_cal_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Contact us'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRouter.getLanguagesRoutes());
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.translate_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Languages'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<AppPagesController>(force: true);
                      Get.toNamed(AppRouter.getAppPagesRoute(),
                          arguments: ['Frequently Asked Questions'.tr, '5'],
                          preventDuplicates: false);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.question_answer_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('FAQs'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<AppPagesController>(force: true);
                      Get.toNamed(AppRouter.getAppPagesRoute(),
                          arguments: ['Help'.tr, '6'],
                          preventDuplicates: false);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.help_outline_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Help'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<AppPagesController>(force: true);
                      Get.toNamed(AppRouter.getAppPagesRoute(),
                          arguments: ['About Us'.tr, '1'],
                          preventDuplicates: false);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('About Us'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      Get.delete<AppPagesController>(force: true);
                      Get.toNamed(AppRouter.getAppPagesRoute(),
                          arguments: ['Terms & Conditions'.tr, '3'],
                          preventDuplicates: false);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lock_reset_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Terms & Conditions'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: InkWell(
                    onTap: () {
                      value.logout();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout_outlined,
                          color: ThemeProvider.appColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Logout'.tr),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
