/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user/app/backend/models/studies_model.dart';
import 'package:user/app/backend/models/terms_model.dart';
import 'package:user/app/controller/register_controller.dart';
import 'package:user/app/env.dart';
import 'package:user/app/util/theme.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (value) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: value.apiCalled == false
              ? const Center(
                  child:
                      CircularProgressIndicator(color: ThemeProvider.appColor),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's get started".tr,
                          style:
                              const TextStyle(fontFamily: 'bold', fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please provide valid details".tr,
                          style: const TextStyle(
                              fontFamily: 'semi-bold', fontSize: 14),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    child: GestureDetector(
                                      onTap: () {
                                        showCupertinoModalPopup<void>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CupertinoActionSheet(
                                            title: Text('Choose From'.tr),
                                            actions: <
                                                CupertinoActionSheetAction>[
                                              CupertinoActionSheetAction(
                                                child: Text('Gallery'.tr),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  value.selectFromGallery(
                                                      'gallery');
                                                },
                                              ),
                                              CupertinoActionSheetAction(
                                                child: Text('Camera'.tr),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  value.selectFromGallery(
                                                      'camera');
                                                },
                                              ),
                                              CupertinoActionSheetAction(
                                                child: Text(
                                                  'Cancel'.tr,
                                                  style: const TextStyle(
                                                      fontFamily: 'bold',
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox.fromSize(
                                            size: const Size.fromRadius(40),
                                            child: FadeInImage(
                                              image: NetworkImage(
                                                  '${Environments.apiBaseURL}storage/images/${value.cover}'),
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
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextField(
                          controller: value.firstName,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'First Name'.tr,
                            floatingLabelStyle:
                                const TextStyle(color: Colors.grey),
                            suffixIcon:
                                const Icon(Icons.account_circle_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: (Colors.grey[300])!)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: value.lastName,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'Last Name'.tr,
                            floatingLabelStyle:
                                const TextStyle(color: Colors.grey),
                            suffixIcon:
                                const Icon(Icons.account_circle_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: (Colors.grey[300])!)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextField(
                          controller: value.emailAddress,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'Email'.tr,
                            floatingLabelStyle:
                                const TextStyle(color: Colors.grey),
                            suffixIcon: const Icon(Icons.email_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: (Colors.grey[300])!)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: value.password,
                          textInputAction: TextInputAction.next,
                          obscureText: value.passwordVisible.value == true
                              ? false
                              : true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'Password'.tr,
                            floatingLabelStyle:
                                const TextStyle(color: Colors.grey),
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
                                borderSide: BorderSide(
                                    width: 2, color: (Colors.grey[300])!)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey[300]!))),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  child: InkWell(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        exclude: <String>['KN', 'MF'],
                                        showPhoneCode: true,
                                        showWorldWide: false,
                                        onSelect: (Country country) {
                                          debugPrint(country.phoneCode);
                                          value.saveCountryCode(
                                              country.phoneCode);
                                        },
                                        countryListTheme: CountryListThemeData(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(40.0),
                                          ),
                                          inputDecoration: InputDecoration(
                                            labelText: 'Search'.tr,
                                            hintText:
                                                'Start typing to search'.tr,
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xFF8C98A8)
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(value.countryCode),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 10,
                                child: TextField(
                                  controller: value.mobile,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Phone Number'.tr),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: value.enrollment,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            labelText: 'Enrollment Number'.tr,
                            floatingLabelStyle:
                                const TextStyle(color: Colors.grey),
                            suffixIcon: const Icon(Icons.numbers_outlined),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: (Colors.grey[300])!)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: ThemeProvider.appColor)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        value.haveStudies == true
                            ? SizedBox(
                                width: double.infinity,
                                child: DropdownButton<StudiesModel>(
                                  isExpanded: true,
                                  value: value.selectedStudies,
                                  items: value.studiesList
                                      .map((StudiesModel value) {
                                    return DropdownMenuItem<StudiesModel>(
                                      value: value,
                                      child: Text(value.name.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    value.onStudiesChanged(
                                        newValue as StudiesModel);
                                  },
                                ),
                              )
                            : Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[300]!))),
                                child: Text('Select Studies'.tr),
                              ),
                        const SizedBox(height: 24),
                        value.haveTerms == true
                            ? SizedBox(
                                width: double.infinity,
                                child: DropdownButton<TermsModel>(
                                  isExpanded: true,
                                  value: value.selectedTerms,
                                  items:
                                      value.termsList.map((TermsModel value) {
                                    return DropdownMenuItem<TermsModel>(
                                      value: value,
                                      child: Text(value.name.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    value
                                        .onTermsChanged(newValue as TermsModel);
                                  },
                                ),
                              )
                            : Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[300]!))),
                                child: Text('Select Terms'.tr),
                              ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: ElevatedButton(
                            onPressed: () {
                              value.register();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: ThemeProvider.appColor,
                                onPrimary: Colors.white,
                                elevation: 0,
                                textStyle: const TextStyle(
                                    fontFamily: 'medium',
                                    letterSpacing: 0.5,
                                    fontSize: 16)),
                            child: Text('Register'.tr),
                          ),
                        ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?".tr),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  debugPrint('login');
                                  Get.back();
                                },
                                child: Text(
                                  'Login'.tr,
                                  style: const TextStyle(
                                      color: ThemeProvider.appColor),
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
