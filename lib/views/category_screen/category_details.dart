import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/controller/product_controller.dart';
import 'package:ecomerce/views/category_screen/items_details.dart';
import 'package:ecomerce/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class categoryDetails extends StatelessWidget {
  final String? title;
  const categoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgwidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    controller.subcat.length,
                    (index) => "${controller.subcat[index]}"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),

            // items container
            20.heightBox,
            Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP1,
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          "Laptop 4GB/64GB"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          "\$600"
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make()
                        ],
                      )
                          .box
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .white
                          .outerShadowSm
                          .roundedSM
                          .padding(EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Get.to(() => ItemDetails(
                              title: "Dummy Item",
                            ));
                      });
                    }))
          ],
        ),
      ),
    ));
  }
}
