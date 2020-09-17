import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      left: size.width * 0.1,
      top: size.height / 2 - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bienvenido",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "¡Descubre más!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),
          )
        ],
      ),
    );
  }
}
