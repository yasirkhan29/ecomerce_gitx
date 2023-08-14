import 'dart:io';

import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/images.dart';
import 'package:ecomerce/controller/profile_controller.dart';
import 'package:ecomerce/widgets_common/bg_widget.dart';
import 'package:ecomerce/widgets_common/custom_textfield.dart';
import 'package:ecomerce/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilescreen extends StatelessWidget {
  final dynamic data;

  const EditProfilescreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgwidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if data image url and controller path is empty
            data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()

                // if data is not empty but controller path is empty
                : data['imageUrl'] != '' && controller.profileImagePath.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    // if both are empty
                    : Image.file(
                        File(controller.profileImagePath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            5.heightBox,
            ourButton(
                color: redColor,
                onPress: () {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            Divider(),
            10.heightBox,
            customTextField(
              controller: controller.nameController,
              hint: nameHint,
              title: name,
              ispass: false,
            ),
            8.heightBox,
            customTextField(
              controller: controller.oldpassController,
              hint: passwordHint,
              title: oldpass,
              ispass: true,
            ),
            8.heightBox,
            customTextField(
              controller: controller.newpassController,
              hint: passwordHint,
              title: newpass,
              ispass: true,
            ),
            10.heightBox,
            controller.isloading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor))
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        color: redColor,
                        onPress: () async {
                          controller.isloading(true);

                          // if image is not selected

                          if (controller.profileImagePath.value.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }

                          // if old password matches data base
                          if (data['password'] ==
                              controller.oldpassController.text) {
                            await controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldpassController.text,
                                newpassword: controller.newpassController.text);

                            await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.newpassController.text);
                            VxToast.show(context, msg: "update");
                          } else {
                            VxToast.show(context,
                                msg:
                                    "old password is wrong please enter correct password");
                            controller.isloading(false);
                          }
                        },
                        textColor: whiteColor,
                        title: "Save"),
                  ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
