/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Easy Exam Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/controller/result_controller.dart';
import 'package:user/app/util/theme.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(builder: (value) {
      return Scaffold(
        backgroundColor: ThemeProvider.whiteColor,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              value.result == true
                  ? ConfettiWidget(
                      confettiController: value.controllerCenter,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ], // manually specify the colors to be used
                      createParticlePath:
                          drawStar, // define a custom shape/path.
                    )
                  : const SizedBox(),
              value.result == true
                  ? Image.asset(
                      'assets/images/passed.gif',
                      height: 200,
                      width: 200,
                    )
                  : Image.asset(
                      'assets/images/failed.gif',
                      height: 200,
                      width: 200,
                    ),
              Text(
                value.result == true
                    ? 'Congratulations'.tr
                    : 'Sorry you are failed'.tr,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'bold',
                    color: value.result == true
                        ? ThemeProvider.appColor
                        : ThemeProvider.redColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value.result == true
                    ? 'You have passed, in this exam'.tr
                    : 'Sorry you are failed, in this exam'.tr,
                style: const TextStyle(fontSize: 14, fontFamily: 'bold'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Here is your marks'.tr,
                style: const TextStyle(fontSize: 14, fontFamily: 'bold'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${value.gained} / ${value.total}',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'bold',
                    color: value.result == true
                        ? ThemeProvider.appColor
                        : ThemeProvider.redColor),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 40,
                margin: const EdgeInsets.only(bottom: 24),
                child: ElevatedButton(
                  onPressed: () {
                    value.onExamStats();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: ThemeProvider.appColor,
                      onPrimary: Colors.white,
                      elevation: 0,
                      textStyle: const TextStyle(
                          fontFamily: 'medium',
                          letterSpacing: 0.5,
                          fontSize: 16)),
                  child: Text('View Stats'.tr),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 40,
                margin: const EdgeInsets.only(bottom: 24),
                child: ElevatedButton(
                  onPressed: () {
                    value.onHome();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: ThemeProvider.appColor,
                      onPrimary: Colors.white,
                      elevation: 0,
                      textStyle: const TextStyle(
                          fontFamily: 'medium',
                          letterSpacing: 0.5,
                          fontSize: 16)),
                  child: Text('Go Home'.tr),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
