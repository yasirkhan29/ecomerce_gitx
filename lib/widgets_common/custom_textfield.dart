import 'package:ecomerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint, controller, ispass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: ispass,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
        ),
      ),
      5.heightBox,
    ],
  );
}
