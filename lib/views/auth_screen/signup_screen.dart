import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/controller/auth_controller.dart';
import 'package:ecomerce/views/home_Screen/home.dart';
import 'package:ecomerce/widgets_common/applogo_widgets.dart';
import 'package:ecomerce/widgets_common/bg_widget.dart';
import 'package:ecomerce/widgets_common/custom_textfield.dart';
import 'package:ecomerce/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());

  // text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgwidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogowidget(),
            10.heightBox,
            "Join the  $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            ////////////////////////////////////////////////////// text field
            Obx(
              () => Column(
                children: [
                  customTextField(
                      title: name,
                      hint: nameHint,
                      controller: nameController,
                      ispass: false),
                  customTextField(
                      title: email,
                      hint: emailHint,
                      controller: emailController,
                      ispass: false),
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController,
                      ispass: true),
                  customTextField(
                      title: retypePassword,
                      hint: passwordHint,
                      controller: passwordRetypeController,
                      ispass: true),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetpass.text.make())),
                  5.heightBox,

                  //////////////////////////////////////   check box
                  Row(
                    children: [
                      Checkbox(
                          checkColor: redColor,
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          }),
                      10.heightBox,
                      Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey)),
                          TextSpan(
                              text: termAndCond,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor)),
                          TextSpan(
                              text: "& ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey)),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor))
                        ])),
                      )
                    ],
                  ),
                  /////////////////////////////////////////  signup
                  controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                          color: isChecked == true ? redColor : lightGrey,
                          title: signup,
                          textColor: whiteColor,
                          onPress: () async {
                            if (isChecked != false) {
                              controller.isloading(true);

                              try {
                                await controller
                                    .signupMethod(
                                        context: context,
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString())
                                    .then((value) {
                                  return controller
                                      .storeUserData(
                                          email:
                                              emailController.text.toString(),
                                          password: passwordController.text
                                              .toString(),
                                          name: nameController.text.toString())
                                      .toString();
                                }).then((value) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                print("error");
                                controller.isloading(false);
                              }
                            }
                          }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  //////////////// Already have a account
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: AlreadyHaveAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey)),
                    TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor))
                  ])).onTap(() {
                    Get.back();
                  })
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
          ],
        ),
      ),
    ));
  }
}
