import 'package:findout/src/widgets/OutLogo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double _logoPositioned = size.height / 2 - 100.0;
    final double _leftPositioned = size.width / 2 - 100.0;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: _logoPositioned,
            left: _leftPositioned,
            child: Text(
              "find",
              style: TextStyle(
                color: Colors.white,
                fontSize: 59,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: _logoPositioned + 60,
            left: _leftPositioned + 100,
            child: OutLogo(),
          ),
        ],
      ),
    );
  }
}
