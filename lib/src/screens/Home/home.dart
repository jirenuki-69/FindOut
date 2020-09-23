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

AnimationController _animationController;
AnimationController _animationControllerArrow;
bool isInitiated = false;
Timer _timer;
const Duration controllersDuration = const Duration( milliseconds: 950 );
const Duration duration = const Duration( milliseconds: 550 );

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController( vsync: this, duration: controllersDuration );
    _animationControllerArrow = AnimationController( vsync: this, duration: controllersDuration );
    _animationController.forward();
    _animationControllerArrow.repeat();

    _timer = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        isInitiated = true; //Empieza la animación de entrada
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerArrow.dispose();
    _timer.cancel();
    isInitiated = false;
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
                animation: _animationController,
                duration: controllersDuration,
                isInitiaded: isInitiated,
              ),
              CategoriesView(
                duration: controllersDuration,
                isInitaded: isInitiated,
              ),
              NombreSitio(
                duration: duration,
                isInitiaded: isInitiated,
              ),
              Arrows(
                top: size.height * 0.55 - iconSize / 2,
                iconSize: iconSize,
                onLeftArrowTapped: () {},
                onRightArrowTapped: () {},
                animation: _animationControllerArrow,
              ),
              InformacionLugar(
                animation: _animationControllerArrow,
                isInitiaded: isInitiated,
              ),
            ],
          );
        },
      ),
    );
  }
}
