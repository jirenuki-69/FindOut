import 'package:findout/src/widgets/FondoOpacidad.dart';
import 'package:flutter/material.dart';

import 'CustomPageView.dart';

// ignore: must_be_immutable
class Post extends AnimatedWidget {
  const Post({
    Key key,
    @required this.whiteContainerHeight,
    @required this.bottom,
    @required this.opacity,
    @required this.onDragged,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);


  final double whiteContainerHeight;
  final double bottom;
  final double opacity;
  final void Function(DragUpdateDetails) onDragged;
  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: bottom,
      left: 0,
      right: 0,
      child: GestureDetector(
        onVerticalDragUpdate: onDragged,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(45 * value),
              ),
              child: CustomPageView(),
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical( bottom: Radius.circular(45 * value), ),
              child: FondoOpacidad(
                opacity: opacity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}