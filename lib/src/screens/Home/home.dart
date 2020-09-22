import 'dart:async';
import 'package:findout/constants/constants.dart';
import 'package:findout/src/widgets/FondoOpacidad.dart';
import 'package:flutter/material.dart';
import 'widgets/Arrows.dart';
import 'widgets/CategoriesView.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/InformacionLugar.dart';
import 'widgets/NombreSitio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

AnimationController _animationControllerArrow;
bool isInitiated = false;
Timer _timer;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationControllerArrow = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 950));
    _animationControllerArrow.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerArrow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double safeArea = kToolbarHeight / 2;
    final double iconSize = 60.0;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationControllerArrow,
        builder: (context, snapshot) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "$imgPath/fondo_lugar.png",
                fit: BoxFit.cover,
              ),
              FondoOpacidad(),
              CustomAppBar(
                safeArea: safeArea,
              ),
              CategoriesView(),
              NombreSitio(),
              Arrows(
                top: size.height * 0.55 - iconSize / 2,
                iconSize: iconSize,
                onLeftArrowTapped: () {},
                onRightArrowTapped: () {},
              ),
              InformacionLugar(
                animation: _animationControllerArrow,
              ),
            ],
          );
        },
      ),
    );
  }
}
