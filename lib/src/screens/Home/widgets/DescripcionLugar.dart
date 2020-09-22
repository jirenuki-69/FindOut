import 'package:flutter/material.dart';

class DescripcionLugar extends StatelessWidget {
  const DescripcionLugar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd",
      style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}