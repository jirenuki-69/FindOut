import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

class InformationStats extends StatelessWidget {
  const InformationStats({
    Key key,
    @required this.favoritesCount,
    @required this.commentsCount,
  }) : super(key: key);

  final int favoritesCount, commentsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 30
            ),
            SizedBox( width: 5 ),
            Text(
              "$favoritesCount",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        SizedBox( width: 50 ),
        Row(
          children: [
            Image.asset(
              "$iconPath/comentario.png",
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            SizedBox( width: 5 ),
            Text(
              "$commentsCount",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        )
      ],
    );
  }
}