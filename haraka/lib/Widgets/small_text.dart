import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haraka/utilis/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double Size;
  double height;

  SmallText(
      {Key? key,
      this.color,
      required this.text,
      this.Size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'lemon',
        color: Colors.blueGrey,
        fontSize: Size == 0 ? Dimensions.font15 : Size,
        height: height,
      ),
    );
  }
}
