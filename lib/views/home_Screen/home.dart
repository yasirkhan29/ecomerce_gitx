import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/controller/home_controller.dart';
import 'package:ecomerce/views/cart_screen/cart_screen.dart';
import 'package:ecomerce/views/category_screen/category_screen.dart';
import 'package:ecomerce/views/home_Screen/home_screen.dart';
import 'package:ecomerce/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    // 1 navbarItem
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    /// 3 var navBody

    var navBody = [
      HomeScreen(),
      categoryScreen(),
      cartScreen(),
      profileScreen(),
    ];

    return Scaffold(
        // 2   bottomNavigationBar

        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: redColor,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            backgroundColor: whiteColor,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
        body: Column(
          children: [
            Obx(
              () => Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value)),
            ),
          ],
        ));
  }
}
