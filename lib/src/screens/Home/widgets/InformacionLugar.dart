import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

import 'DescripcionLugar.dart';
import 'InformationStats.dart';

class InformacionLugar extends AnimatedWidget {
  const InformacionLugar({
    Key key,
    @required this.isInitiaded,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  double get value => (listenable as Animation).value;
  final bool isInitiaded;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: size.height * .35,
      child: AnimatedOpacity(
        duration: const Duration( milliseconds: 900 ),
        opacity: isInitiaded ? 1 : 0,
        curve: Curves.slowMiddle,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.63),
          ),
          padding: EdgeInsets.symmetric(horizontal: homePadding, vertical: 15),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Información",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DescripcionLugar(),
                Container(
                  height: constraints.maxHeight * 0.3,
                  child: InformationStats(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10 * value,
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 35,
                      color: Colors.white,
                    ),
                    
                    Text(
                      "Desliza hacia arriba",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
