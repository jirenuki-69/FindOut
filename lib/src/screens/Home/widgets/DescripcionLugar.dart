import 'package:flutter/material.dart';

class DescripcionLugar extends StatelessWidget {
  const DescripcionLugar({
    Key key,
    @required this.descripcion,
  }) : super(key: key);

  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Text(
      descripcion,
      style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}