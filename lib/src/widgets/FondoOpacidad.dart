import 'package:flutter/material.dart';

class FondoOpacidad extends StatelessWidget {
  const FondoOpacidad({
    Key key,
    this.opacity = 0.2,
  }) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(opacity),
    );
  }
}