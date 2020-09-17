import 'package:flutter/material.dart';

class FondoOpacidad extends StatelessWidget {
  const FondoOpacidad({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
    );
  }
}