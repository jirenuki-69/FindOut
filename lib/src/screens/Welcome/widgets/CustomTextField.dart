import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.containerWidth, @required this.icon, @required this.hintText, @required this.onChanged,
  }) : super(key: key);

  final double containerWidth;
  final String icon;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    double iconSize = 18.0;

    return Container(
      width: containerWidth,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(2.0, 2.0),
                spreadRadius: 5.0,
                blurRadius: 30.0,
                color: Colors.black26)
          ]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0, right: 10.0),
            child: Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                ),
                onSubmitted: onChanged,
              ),
            ),
          )
        ],
      ),
    );
  }
}