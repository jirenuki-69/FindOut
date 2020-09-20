import 'package:flutter/material.dart';

class PhotoAuthor extends AnimatedWidget {
  const PhotoAuthor({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height / 2 - 100,
      left: size.width * 0.1,
      child: AnimatedOpacity(
        duration:  Duration.zero,
        opacity: 1 - value,
        child: Text(
          "Photo by Miguel Fuentes\n on Splash",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}