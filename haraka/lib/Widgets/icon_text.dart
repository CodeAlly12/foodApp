import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haraka/Widgets/small_text.dart';
import 'package:haraka/utilis/dimensions.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final iconColor;

  IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconsize15,
        ),
        SizedBox(width: Dimensions.width20),
        SmallText(
          text: text,
          color: color,
        )
      ],
    );
  }
}
