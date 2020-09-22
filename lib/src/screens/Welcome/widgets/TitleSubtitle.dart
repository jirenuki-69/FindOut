import 'package:flutter/material.dart';

class TitleSubtitle extends AnimatedWidget {
  const TitleSubtitle({
    Key key,
    @required this.whiteContainerHeight,
    @required this.texto,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  final double whiteContainerHeight;
  final String texto;
  Animation<double> get animation => (listenable as Animation);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double _centeredTitle = size.width / 2 - size.width / 4;

    return Positioned(
      bottom: whiteContainerHeight,
      left: _centeredTitle,
      child: IgnorePointer(
        child: FadeTransition(
          opacity: animation,
          child: Container(
            width: size.width / 2,
            child: Column(
              children: [
                Text(
                  texto,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Deliza para ir hacia atrás",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
