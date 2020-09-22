import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

class NombreSitio extends StatelessWidget {
  const NombreSitio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      left: homePadding,
      top: size.height * 0.35 - 60 / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cocktails",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Luango",
            style: TextStyle(
              color: Colors.white,
              fontSize: 47,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}