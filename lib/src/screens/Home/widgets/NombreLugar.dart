import 'package:flutter/material.dart';

class NombreLugar extends StatelessWidget {
  const NombreLugar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Zihuatanejo, México",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white
          ),
        ),
      ],
    );
  }
}