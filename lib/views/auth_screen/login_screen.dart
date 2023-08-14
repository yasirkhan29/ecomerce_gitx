import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/list.dart';
import 'package:ecomerce/controller/auth_controller.dart';
import 'package:ecomerce/views/auth_screen/signup_screen.dart';
import 'package:ecomerce/views/home_Screen/home.dart';
import 'package:ecomerce/widgets_common/applogo_widgets.dart';
import 'package:ecomerce/widgets_common/bg_widget.dart';
import 'package:ecomerce/widgets_common/custom_textfield.dart';
import 'package:ecomerce/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgwidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogowidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      title: email,
                      hint: emailHint,
                      ispass: false,
                      controller: controller.emailController),
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      ispass: true,
                      controller: controller.passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetpass.text.make())),
                  5.heightBox,
                  ///////////////////////////////////////////////////////////// sign in button
                  controller.isloading.value
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onPress: () async {
                            controller.isloading(true);
                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => Home());
                              } else {
                                controller.isloading(false);
                              }
                            });
                          }).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  /////////////////////////////////////////////////////////////// signup button
                  ourButton(
                      color: const Color.fromARGB(255, 190, 179, 73),
                      title: signup,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ),
            10.heightBox,
            loginwith.text.color(fontGrey).make(),
            5.heightBox,
            //////////////////////////////////////////////////// google facebook twitter login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(
                            socialIconList[index],
                            width: 30,
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    ));
  }
}
