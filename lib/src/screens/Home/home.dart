import 'dart:async';
import 'package:findout/src/models/Sitio.dart';
import 'package:findout/src/widgets/FondoOpacidad.dart';
import 'package:flutter/material.dart';
import 'widgets/Arrows.dart';
import 'widgets/CategoriesView.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/InformacionLugar.dart';
import 'widgets/NombreSitio.dart';
import 'widgets/PageViewSitios.dart';
import 'widgets/Social.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

AnimationController _animationController;
AnimationController _animationControllerArrow;
bool isInitiated = false;
bool socialOpened = false;
Timer _timer;
int index;
const Duration controllersDuration = const Duration(milliseconds: 950);
const Duration duration = const Duration(milliseconds: 550);

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    index = 0;
    _animationController =
        AnimationController(vsync: this, duration: controllersDuration);
    _animationControllerArrow =
        AnimationController(vsync: this, duration: controllersDuration);
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
    socialOpened = false;
    super.dispose();
  }

  void _onVerticalUpdate(DragUpdateDetails value) {
    print(value.primaryDelta);
    if (value.primaryDelta < -1.5) {
      setState(() {
        socialOpened = true;
      });
    }
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
              PageViewSitios(
                sitio: sitios[index],
              ),
              FondoOpacidad(),
              socialOpened ? Social() : SizedBox.shrink(),
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
                nombre: sitios[index].name,
                profession: sitios[index].profession,
              ),
              Arrows(
                top: size.height * 0.55 - iconSize / 2,
                iconSize: iconSize,
                onLeftArrowTapped: () {
                  setState(() {
                    index = index == 0 ? index = sitios.length - 1 : index - 1;
                  });
                },
                onRightArrowTapped: () {
                  setState(() {
                    index = index == sitios.length - 1 ? 0 : index + 1;
                  });
                },
                animation: _animationControllerArrow,
              ),
              socialOpened
                  ? Social()
                  : Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: size.height * .35,
                      child: InformacionLugar(
                        animation: _animationControllerArrow,
                        isInitiaded: isInitiated,
                        informacion: sitios[index].description,
                        favoritesCount: sitios[index].favoritesCount,
                        commentsCount: sitios[index].commentsCount,
                        onVerticalUpdate: (value) => _onVerticalUpdate(value),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}



