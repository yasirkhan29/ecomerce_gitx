import 'package:ecomerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(20).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.height(80).width(width).padding(EdgeInsets.all(4)).make();
}
