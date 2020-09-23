import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';
import 'CircleAvatarIconButton.dart';
import 'NombreLugar.dart';

class CustomAppBar extends AnimatedWidget {
  const CustomAppBar({
    Key key,
    @required this.safeArea,
    @required this.duration,
    @required this.isInitiaded,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  final double safeArea;
  final Duration duration;
  final bool isInitiaded;
  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    double translate = - 100 + 100 * value;

    return Positioned(
      left: 0,
      right: 0,
      top: safeArea,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Transform(
          transform: Matrix4.identity()..translate(0.0, translate),
          child: AnimatedOpacity(
            duration: duration,
            opacity: isInitiaded ? 1 : 0,
            curve: Curves.easeInOut,
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
        ),
      ),
    );
  }
}
