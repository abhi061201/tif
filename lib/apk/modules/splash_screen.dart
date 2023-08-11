import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tif/apk/modules/home/view/HomeView.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 3), () {
      Get.off(Home_View());
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.center,
            child: Container(
              width: Get.width * 0.8,
              child: Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
