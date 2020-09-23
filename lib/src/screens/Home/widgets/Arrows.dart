import 'package:flutter/material.dart';

class Arrows extends AnimatedWidget {
  const Arrows({
    Key key,
    @required this.onLeftArrowTapped,
    @required this.onRightArrowTapped,
    @required this.top,
    @required this.iconSize,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  final VoidCallback onLeftArrowTapped;
  final VoidCallback onRightArrowTapped;
  final double top;
  final double iconSize;
  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0 * value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onLeftArrowTapped,
              child: Icon(Icons.keyboard_arrow_left,
                  color: Colors.white, size: iconSize),
            ),
            InkWell(
              onTap: onRightArrowTapped,
              child: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: iconSize),
            ),
          ],
        ),
      ),
    );
  }
}
