import 'package:ecomerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgwidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}
