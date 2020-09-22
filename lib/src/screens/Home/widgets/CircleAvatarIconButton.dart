import 'package:flutter/material.dart';

class CircleAvatarIconButton extends StatelessWidget {
  const CircleAvatarIconButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.4),
        child: Image.asset(
          icon
        )
      ),
    );
  }
}