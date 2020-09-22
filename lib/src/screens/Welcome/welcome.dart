import 'package:findout/src/screens/Welcome/widgets/BottomContainer.dart';
import 'package:findout/src/screens/Welcome/widgets/PhotoAuthor.dart';
import 'package:findout/src/screens/Welcome/widgets/Post.dart';
import 'package:findout/src/screens/Welcome/widgets/SnakeButtons.dart';
import 'package:findout/src/screens/Welcome/widgets/TitleSubtitle.dart';
import 'package:findout/src/screens/Welcome/widgets/WelcomeText.dart';
import 'package:findout/src/widgets/OutLogo.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

AnimationController _controller;
AnimationController _controller2;
Animation<double> animation;
int milliseconds = 350;
bool isOpened;
String titulo = "Iniciar Sesión";

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    isOpened = false;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: milliseconds),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: milliseconds + 100),
    );

    _controller.addStatusListener((status) {
      status == AnimationStatus.completed ? _controller2.forward() : null;
    });

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInQuint));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _changeState(String text) {
    setState(() {
      titulo = text;
      isOpened = true;
    });
    _controller.forward();
  }

  void _onDraggedDown(DragUpdateDetails value) {
      if(value.delta.dy > 0.5) { 
        setState(() {
          isOpened = false;
        });
        _controller.reverse(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double _logoPositioned = size.height * 0.08;
    final double _leftPositioned = size.width / 2 - 100.0;
    final double whiteContainerHeight = size.height * 0.4;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double postBottom = (0 + _controller.value * 300).clamp(0, whiteContainerHeight);
          double formHeight = isOpened ? whiteContainerHeight * 0.8 : 100.0;
          double opacity = 0.2 + (_controller.value * 0.2);

          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  BottomContainer(
                    whiteContainerHeight: whiteContainerHeight,
                    height: formHeight.abs(),
                    loginPressed: titulo == "Iniciar Sesión" ? true : false
                  ),
                  Post(
                    whiteContainerHeight: whiteContainerHeight,
                    bottom: postBottom,
                    opacity: opacity,
                    animation: _controller,
                    onDragged: (value) => _onDraggedDown(value),
                  ),
                  Positioned(
                    top: _logoPositioned + 50 * _controller.value,
                    left: _leftPositioned,
                    child: Text(
                      "find",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 59,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (_logoPositioned + 60) + 50 * _controller.value,
                    left: (_leftPositioned) + 100.0,
                    child: OutLogo(),
                  ),

                  _controller.isCompleted
                  ? TitleSubtitle(
                      whiteContainerHeight: whiteContainerHeight,
                      animation: animation,
                      texto: titulo,
                    )
                  : SizedBox.shrink(),

                  PhotoAuthor(animation: _controller,),
                  WelcomeText(animation: _controller,),
                  _controller.value != 1 ? SnakeButtons(
                    animation: _controller,
                    onLoginPressed: () => _changeState("Iniciar Sesión"),
                    onSignUpPressed: () => _changeState("Crear Cuenta"),
                  ) : SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
