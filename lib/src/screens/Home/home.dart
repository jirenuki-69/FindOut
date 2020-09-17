import 'package:findout/constants/constants.dart';
import 'package:findout/src/screens/Home/widgets/SnakeButtons.dart';
import 'package:findout/src/screens/Home/widgets/WelcomeText.dart';
import 'package:findout/src/widgets/FondoOpacidad.dart';
import 'package:findout/src/widgets/OutLogo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double _logoPositioned = size.height * 0.08;
    final double _leftPositioned = size.width / 2 - 100.0;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "$imgPath/fondo1.jpg",
            fit: BoxFit.cover,
          ),
          FondoOpacidad(),
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
            left: (_leftPositioned) + 100.0,
            child: OutLogo(),
          ),
          WelcomeText(),
          SnakeButtons(),
        ],
      ),
    );
  }
}


