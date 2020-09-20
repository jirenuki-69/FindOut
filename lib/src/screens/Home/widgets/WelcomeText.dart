import 'package:flutter/material.dart';

class WelcomeText extends AnimatedWidget {
  const WelcomeText({
    Key key,
    Animation<double> animation
  }) : super(key: key, listenable: animation);

  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double _verticalPosition = size.height / 2 - 100;

    return Positioned(
      left: size.width * 0.1,
      bottom: _verticalPosition,
      child: AnimatedOpacity(
        duration: Duration.zero,
        opacity: 1 - value,
        child:  Column(
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
      ),
    );
  }
}
