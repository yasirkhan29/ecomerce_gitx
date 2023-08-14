import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/list.dart';
import 'package:ecomerce/controller/auth_controller.dart';
import 'package:ecomerce/controller/profile_controller.dart';
import 'package:ecomerce/services/firestore_services.dart';
import 'package:ecomerce/views/auth_screen/login_screen.dart';
import 'package:ecomerce/views/profile_screen/commonts/details_card.dart';
import 'package:ecomerce/views/profile_screen/edit_profile_screen.dart';
import 'package:ecomerce/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return SafeArea(
      child: bgwidget(
        child: Scaffold(
            body: StreamBuilder(
          builder:
              (BuildContext conttext, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return Column(
                children: [
                  // edit profile button

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.edit, color: Colors.white))
                        .onTap(() {
                      controller.nameController.text = data['name'];
                      Get.to(() => EditProfilescreen(data: data));
                    }),
                  ),
                  // users details section
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(imgProfile2,
                                    width: 50, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make()
                            : Image.network(data['imageUrl'],
                                    width: 50, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make(),
                        10.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            "${data['email']}".text.white.make(),
                          ],
                        ),
                        100.widthBox,
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: whiteColor)),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => loginScreen());
                            },
                            child: "Logout"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make()),
                      ],
                    ),
                  ),

                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                        count: data['cart_count'],
                        title: "In your card",
                        width: context.screenWidth / 3.4,
                      ),
                      detailsCard(
                        count: data['wishlist_count'],
                        title: "In your  wish list",
                        width: context.screenWidth / 3.2,
                      ),
                      detailsCard(
                        count: data['order_count'],
                        title: "In your orders",
                        width: context.screenWidth / 3.2,
                      ),
                    ],
                  ),
                  ////////////////////////////////////////////// buttons section
                  ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcon[index],
                                width: 21,
                              ),
                              title: "${profileButtonList[index]}"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: lightGrey,
                            );
                          },
                          itemCount: profileButtonList.length)
                      .box
                      .white
                      .margin(EdgeInsets.all(12))
                      .rounded
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make(),
                ],
              );
            }
          },
          stream: FirestoreServices.getUser(currentUser!.uid),
        )),
      ),
    );
  }
}
