import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

class Arrows extends StatelessWidget {
  const Arrows({Key key, @required this.onLeftArrowTapped, @required this.onRightArrowTapped,@required this.top, @required this.iconSize}) : super(key: key);

  final VoidCallback onLeftArrowTapped;
  final VoidCallback onRightArrowTapped;
  final double top;
  final double iconSize;

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onLeftArrowTapped,
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: iconSize
            ),
          ),
          InkWell(
            onTap: onRightArrowTapped,
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: iconSize
            ),
          ),
        ],
      ),
    );
  }
}