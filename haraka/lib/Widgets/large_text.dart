import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:haraka/utilis/dimensions.dart';

class LargeText extends StatelessWidget {
  final Color? color;
  final String text;
  double Size;
  TextOverflow overflow;
  LargeText(
      {Key? key,
      this.color,
      required this.text,
      this.Size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'lemon',
        color: color,
        fontSize: Size == 0 ? Dimensions.font15 : Size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
