import 'dart:async';
import 'package:findout/src/screens/Welcome/Welcome.dart';
import 'package:findout/src/screens/SplashScreen/SplashScreen.dart';
import 'package:findout/src/widgets/FondoOpacidad.dart';
import 'package:findout/src/widgets/OutLogo.dart';
import 'package:findout/static/backgrounds.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double movement = -100.0;
  int index = 0;
  Timer _timer;
  bool splashScreen = true;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3500));
    _controller.forward();
    _timer = Timer.periodic(const Duration(milliseconds: 3500), (Timer t) {
      
      index = index == backgrounds.length - 1 ? 0 : index + 1;
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          splashScreen = false;
        });
      });
      _controller.reset();
      _controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle primaryStyle = TextStyle(
        color: Colors.white, fontSize: 59, fontWeight: FontWeight.bold);
    final double _logoPositioned = size.height * 0.15;
    final double _leftPositioned = size.width / 2 - 100.0;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, animation1, animation2) {
              return FadeTransition(
                opacity: animation1,
                child: WelcomePage(),
              );
            },
          ),
        );
      },
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, snapshot) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: movement * _controller.value,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Image(
                        key: Key(backgrounds[index].imagen),
                        image: AssetImage(
                          backgrounds[index].imagen,
                        ),
                        fit: BoxFit.cover,
                        width: size.width,
                        height: size.height,
                      ),
                    ),
                  ),
                ),
                FondoOpacidad(),
                Positioned(
                  top: size.height * 0.08,
                  left: size.width / 2 - 150,
                  width: 300,
                  child: Text(
                    "Toque la pantalla para \npoder continuar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  bottom: _logoPositioned,
                  left: _leftPositioned,
                  child: Text(
                    "find",
                    style: primaryStyle,
                  ),
                ),
                Positioned(
                  bottom: _logoPositioned - 60,
                  left: (_leftPositioned) + 100.0,
                  child: OutLogo(),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: splashScreen
                  ? Stack(
                    children: [
                      Image(image: AssetImage(backgrounds[0].imagen)),
                      Image(image: AssetImage(backgrounds[1].imagen)),
                      Image(image: AssetImage(backgrounds[2].imagen)),
                      SplashScreen(),
                    ],
                  )
                  : SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
