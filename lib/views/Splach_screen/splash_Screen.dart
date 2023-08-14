import 'package:ecomerce/consts/colors.dart';
import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/views/auth_screen/login_screen.dart';
import 'package:ecomerce/views/home_Screen/home.dart';
import 'package:ecomerce/widgets_common/applogo_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.to(() => loginScreen());

      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => loginScreen());
        } else {
          Get.to(() => Home());
        }
      });
    });
  }

  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  icSplashBg,
                  width: 300,
                )),
            20.heightBox,
            applogowidget(),
            appname.text.fontFamily(bold).size(22).white.make(),
            3.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
