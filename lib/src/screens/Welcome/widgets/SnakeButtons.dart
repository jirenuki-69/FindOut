import 'package:findout/constants/constants.dart';
import 'package:findout/src/animations/SnakeButton.dart';
import 'package:flutter/material.dart';

class SnakeButtons extends AnimatedWidget {
  const SnakeButtons({Key key, Animation<double> animation, this.onLoginPressed, this.onSignUpPressed}) : super(key: key, listenable: animation);

  double get value => (listenable as Animation).value;
  final VoidCallback onLoginPressed;
  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double _buttonPosition = size.width * 0.1;

    return Positioned(
      bottom: size.height * 0.1,
      left: _buttonPosition,
      right: _buttonPosition,
      child: AnimatedOpacity(
        duration: Duration.zero,
        opacity: 1 - value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SnakeButton(
              onTap: onLoginPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              borderWidth: 2.0,
              snakeColor: primaryColor,
            ),
            SnakeButton(
              onTap: onSignUpPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Crear Cuenta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              borderWidth: 2.0,
              snakeColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
