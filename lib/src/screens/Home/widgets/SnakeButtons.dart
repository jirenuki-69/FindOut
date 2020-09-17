import 'package:findout/constants/constants.dart';
import 'package:findout/src/animations/SnakeButton.dart';
import 'package:flutter/material.dart';

class SnakeButtons extends StatelessWidget {
  const SnakeButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return Positioned(
      bottom: size.height * 0.1,
      left: size.width * 0.1,
      right: size.width * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SnakeButton(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
            onTap: () {},
            duration: const Duration(milliseconds: 1000),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
    );
  }
}
