import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haraka/Widgets/icon_text.dart';
import 'package:haraka/Widgets/large_text.dart';
import 'package:haraka/Widgets/small_text.dart';
import 'package:haraka/utilis/dimensions.dart';

class Foodpage extends StatefulWidget {
  const Foodpage({Key? key}) : super(key: key);

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  // page controlls of movements left to right
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.PageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  //  dispose the page activity
  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //slider top
      Container(
        height: Dimensions.PageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 6,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      //dot slider indictor
      DotsIndicator(
        dotsCount: 6,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: Colors.grey,
          shape: Border(),
          color: Color.fromARGB(255, 253, 253, 253),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      //popular list title
      SizedBox(
        height: Dimensions.height30,
      ),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          children: [
            LargeText(
              text: "Discover popular picks .",
              color: Colors.white,
            ),
          ],
        ),
      ),
      //list of popular picks
      Container(
        height: 700,
        child: (ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20),
                child: Row(
                  children: [
                    //popular pick images
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.Radius20),
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/burger.jpg",
                              ))),
                    ),
                    // text about popular pick
                    Expanded(
                        child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.Radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.Radius20)),
                          color: Color.fromARGB(255, 31, 30, 30)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LargeText(
                              text: "Burger Place",
                              color: Colors.white,
                            ),
                            SmallText(
                              text: "Best burgers in town",
                              color: Colors.white,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                IconText(
                                  icon: Icons.favorite_sharp,
                                  text: "likes",
                                  color: Colors.white,
                                  iconColor: Colors.red,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                IconText(
                                    icon: Icons.location_pin,
                                    text: "1.7km",
                                    color: Colors.white,
                                    iconColor: Colors.green),
                                IconText(
                                    icon: Icons.access_time_rounded,
                                    text: "35mins",
                                    color: Colors.white,
                                    iconColor: Colors.grey),
                                SizedBox(
                                  height: Dimensions.height15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              );
            }))),
      )
    ]);
  }

  Widget _buildPageItem(int index) {
    // scaling the page
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currscale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currscale =
          _scaleFactor + (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currscale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.PageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.Radius30),
              color: index.isEven ? Colors.blueGrey : Colors.white,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/steak.jpg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.PageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.Radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 122, 121, 121),
                        blurRadius: 4.0,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width30,
                ),
                child: Column(
                  children: [
                    LargeText(text: "Steak House"),
                    SmallText(text: "Amazingly delicious"),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.stars,
                                    color: Colors.green,
                                    size: 10,
                                  )),
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.width15),
                        SmallText(text: "38"),
                        SizedBox(width: Dimensions.width15),
                        SmallText(text: "Reviews"),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          icon: Icons.favorite_sharp,
                          text: "likes",
                          color: Colors.white,
                          iconColor: Colors.red,
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        IconText(
                            icon: Icons.location_pin,
                            text: "1.7km",
                            color: Colors.white,
                            iconColor: Colors.green),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        IconText(
                            icon: Icons.access_time_rounded,
                            text: "35mins",
                            color: Colors.white,
                            iconColor: Colors.grey)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
