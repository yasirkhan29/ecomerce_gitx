import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/list.dart';
import 'package:ecomerce/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                        autoPlay: true,
                        height: 300,
                        itemCount: 3,
                        aspectRatio: 16 / 9,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      10.heightBox,
                      ////////////////////////////////////////////  title and details section

                      title!.text
                          .size(16)
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      ////////////////////////////////////////// rating

                      VxRating(
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        size: 25,
                        count: 5,
                        stepInt: true,
                      ),
                      10.heightBox,
                      /////////////////////////////////////// text price
                      "\$30,000"
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(18)
                          .make(),
                      10.heightBox,
                      ////////////////////////////////////////circular avetaor message
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          )
                        ],
                      )
                          .box
                          .height(60)
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldGrey)
                          .make(),
                      20.heightBox,
                      ///////////////////////////////////////////// colors selection
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Color:".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .color(Vx.randomPrimaryColor)
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .roundedFull
                                      .make(),
                                ),
                              )
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                          //////////////////////////////////////////////////// quantity row

                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity:"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ),
                              Row(children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                10.heightBox,
                                "(0 available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ]),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),

                          ////////////////////////////////////////////////// totel row
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Total:".text.color(textfieldGrey).make(),
                              ),
                              "\$0.00"
                                  .text
                                  .color(redColor)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),

                      ////////////////////////////////////////////////////////// Description section

                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "This is dummy item and dummy description here ... "
                          .text
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      ////////////////////////////////////////////////////// Button section
                      Column(
                        children: List.generate(
                            itemDetailButtonList.length,
                            (index) => ListTile(
                                  title: "${itemDetailButtonList[index]}"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  trailing: Icon(Icons.arrow_forward),
                                )),
                      ),
                      // 20.heightBox,

                      /////////////////////////////////////////////////////// product you may like
                      productsyoumaylike.text
                          .fontFamily(bold)
                          .size(16)
                          .color(darkFontGrey)
                          .make(),
                      /////////////////////////////////// copied this from home screen featurd products

                      20.heightBox,
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
              )),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ourButton(
                    color: redColor,
                    onPress: () {},
                    textColor: whiteColor,
                    title: "Add to cart"),
              )
            ],
          ),
        ));
  }
}
