/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:user/app/controller/login_controller.dart';
import 'package:user/app/controller/reset_password_controller.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/constant.dart';
import 'package:user/app/util/theme.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget getLanguages() {
    return PopupMenuButton(
      onSelected: (value) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: IconButton(
          icon: const Icon(Icons.translate),
          color: ThemeProvider.blackColor,
          onPressed: () {},
        ),
      ),
      itemBuilder: (context) => AppConstants.languages
          .map((e) => PopupMenuItem<String>(
                value: e.languageCode.toString(),
                onTap: () {
                  var locale = Locale(e.languageCode.toString());
                  Get.updateLocale(locale);
                  Get.find<LoginController>().saveLanguage(e.languageCode);
                },
                child: Text(e.languageName.toString()),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (value) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: <Widget>[getLanguages()],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to continue'.tr,
                    style: const TextStyle(fontFamily: 'bold', fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: value.emailAddress,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: 'Email'.tr,
                      floatingLabelStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.email_outlined),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: (Colors.grey[300])!)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: ThemeProvider.appColor)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: value.password,
                    textInputAction: TextInputAction.next,
                    obscureText:
                        value.passwordVisible.value == true ? false : true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: 'Password'.tr,
                      floatingLabelStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: () {
                          value.togglePassword();
                        },
                        child: Icon(
                          value.passwordVisible.value == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ThemeProvider.greyColor,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: (Colors.grey[300])!)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: ThemeProvider.appColor)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        value.login();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: ThemeProvider.appColor,
                          onPrimary: Colors.white,
                          elevation: 0,
                          textStyle: const TextStyle(
                              fontFamily: 'medium',
                              letterSpacing: 0.5,
                              fontSize: 16)),
                      child: Text('Login'.tr),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.delete<ResetPasswordController>(force: true);
                          Get.toNamed(AppRouter.getResetPasswordRoutes());
                        },
                        child: Text(
                          'Forgot Password?'.tr,
                          style: const TextStyle(color: ThemeProvider.appColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?".tr),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRouter.getRegisterRoutes());
                          },
                          child: Text(
                            'Register'.tr,
                            style:
                                const TextStyle(color: ThemeProvider.appColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
