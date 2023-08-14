import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/list.dart';
import 'package:ecomerce/views/home_Screen/components/featuerd_button.dart';
import 'package:ecomerce/widgets_common/home_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(12),
            color: lightGrey,
            width: context.screenWidth,
            height: context.screenHeight,
            child: SingleChildScrollView(
              child: Column(children: [
                //////////////// text field
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  color: lightGrey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: whiteColor,
                        hintText: searchanything,
                        hintStyle: TextStyle(color: textfieldGrey)),
                  ),
                ),
                ////////////////////////////////// swiper brand
                VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 150,
                  enlargeCenterPage: true,
                  itemCount: sliderList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          sliderList[index],
                          fit: BoxFit.fill,
                        ).box.rounded.clip(Clip.antiAlias).make());
                  },
                ),
                20.heightBox,
                ///////////////////////////////// deals buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      2,
                      (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          title: index == 0 ? todayDeal : flashsale,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal)),
                ),
                20.heightBox,
                ////////////////////////////////// second swiper brand
                VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 150,
                  enlargeCenterPage: true,
                  itemCount: secondSlidersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          secondSlidersList[index],
                          fit: BoxFit.fill,
                        ).box.rounded.clip(Clip.antiAlias).make());
                  },
                ),
                20.heightBox,
                /////////////////////////////////// three buttons
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButton(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topCategories
                                : index == 1
                                    ? brand
                                    : topSellers))),
                20.heightBox,
                ///////////////////////////// featuers catagories
                Align(
                  alignment: Alignment.centerLeft,
                  child: featuerdCategories.text
                      .color(darkFontGrey)
                      .size(18)
                      .fontFamily(semibold)
                      .make(),
                ),
                ///////////////////////
                20.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => Column(
                              children: [
                                featureButton(
                                    icon: featuredImages1[index],
                                    title: freaturedTitles1[index]),
                                10.heightBox,
                                featureButton(
                                    icon: featuredImages2[index],
                                    title: freaturedTitles2[index]),
                              ],
                            )),
                  ),
                ),
                // featuer product
                20.heightBox,
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(color: redColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featueredProduct.text.white
                          .fontFamily(bold)
                          .size(18)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: 150,
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
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .white
                                      .roundedSM
                                      .padding(EdgeInsets.all(8))
                                      .make()),
                        ),
                      )
                    ],
                  ),
                ),

                20.heightBox,
                //////////////////////////// third swiper
                VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 150,
                  enlargeCenterPage: true,
                  itemCount: secondSlidersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          secondSlidersList[index],
                          fit: BoxFit.fill,
                        ).box.rounded.clip(Clip.antiAlias).make());
                  },
                ),
                20.heightBox,
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP1,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          Spacer(),
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
                          .roundedSM
                          .padding(EdgeInsets.all(12))
                          .make();
                    })
              ]),
            )),
      ),
    );
  }
}
