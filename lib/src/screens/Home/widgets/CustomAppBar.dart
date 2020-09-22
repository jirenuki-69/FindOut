import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

import 'CircleAvatarIconButton.dart';
import 'NombreLugar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key, @required this.safeArea}) : super(key: key);

  final double safeArea;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: safeArea,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
          height: kToolbarHeight,
          width: double.infinity,
          child: Row(
            children: [
              CircleAvatarIconButton(
                icon: "$iconPath/settings.png",
                onTap: () {},
              ),
              Expanded(
                child: Center(
                  child: NombreLugar(),
                ),
              ),
              CircleAvatarIconButton(
                icon: "$iconPath/user.png",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
