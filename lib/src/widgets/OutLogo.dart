import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

class OutLogo extends StatelessWidget {
  const OutLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "$iconPath/search-solid.png",
          width: 50,
          height: 50,
        ),
        Text(
          "ut",
          style: TextStyle(
            color: Colors.white,
            fontSize: 59,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}