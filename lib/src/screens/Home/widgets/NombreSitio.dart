import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

class NombreSitio extends StatelessWidget {
  const NombreSitio({
    Key key,
    @required this.duration,
    @required this.isInitiaded,
    @required this.nombre,
    @required this.profession,
  }) : super(key: key);

  final Duration duration;
  final bool isInitiaded;
  final String nombre;
  final String profession;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      left: homePadding,
      top: size.height * 0.35 - 60 / 2,
      child: AnimatedContainer(
        duration: duration,
        curve: Curves.elasticOut,
        width: isInitiaded ? 200 : 20,
        height: isInitiaded ? 120 : 20,
        child: FittedBox(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Column(
              key: Key(nombre),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profession,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  nombre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
