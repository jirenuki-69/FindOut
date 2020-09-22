import 'package:flutter/material.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    Key key,
    @required this.child,
    @required this.flex,
  }) : super(key: key);

  final Widget child;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 60,
        padding: EdgeInsets.all(15.0),
        child: child,
      ),
    );
  }
}