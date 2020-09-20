import 'package:flutter/material.dart';
import 'CustomLoginForm.dart';
import 'CustomSignUpForm.dart';

class BottomContainer extends StatefulWidget {
  BottomContainer({
    Key key,
    @required this.whiteContainerHeight,
    @required this.height,
    @required this.loginPressed,
  }) : super(key: key);

  final double whiteContainerHeight;
  final bool loginPressed;
  double height;

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double containerWidth = size.width * 0.9;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        height: widget.whiteContainerHeight,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1300),
          curve: Curves.elasticOut,
          width: containerWidth,
          height: widget.height,
          child: widget.loginPressed == true
            ? CustomLoginForm(containerWidth: containerWidth) 
            : CustomSignUpForm(containerWidth: containerWidth),
        ),
      ),
    );
  }
}