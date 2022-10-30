import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haraka/Widgets/large_text.dart';
import 'package:haraka/home/food_page.dart';
import 'package:haraka/utilis/dimensions.dart';
import '../Widgets/small_text.dart';

class Food_Main extends StatefulWidget {
  const Food_Main({Key? key}) : super(key: key);

  @override
  State<Food_Main> createState() => _Food_MainState();
}

class _Food_MainState extends State<Food_Main> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      LargeText(
                        text: "find your favorite dishes",
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Malindi",
                            color: Colors.white10,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.white,
                            size: Dimensions.iconsize15,
                          ),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        size: Dimensions.iconsize15,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.Radius15),
                          color: Color.fromARGB(255, 203, 210, 214)),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: Foodpage(),
          ))
        ],
      ),
    );
  }
}
