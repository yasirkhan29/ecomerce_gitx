import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/list.dart';
import 'package:ecomerce/controller/product_controller.dart';
import 'package:ecomerce/views/category_screen/category_details.dart';
import 'package:ecomerce/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgwidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoriesImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make()
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                // yasiro
                controller.getSubCategories(categoriesList[index]);
                Get.to(() => categoryDetails(title: categoriesList[index]));
              });
            })),
      ),
    ));
  }
}
