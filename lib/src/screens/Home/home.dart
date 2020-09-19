import 'package:findout/constants/constants.dart';
import 'package:findout/src/animations/SnakeButton.dart';
import 'package:findout/src/screens/Home/widgets/CustomForm.dart';
import 'package:findout/src/screens/Home/widgets/CustomPageView.dart';
import 'package:findout/src/screens/Home/widgets/WelcomeText.dart';
import 'package:findout/src/widgets/FondoOpacidad.dart';
import 'package:findout/src/widgets/OutLogo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

AnimationController _controller;
AnimationController _controller2;
Animation<double> animation;
int milliseconds = 350;
bool isOpened;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration.zero;
    final Size size = MediaQuery.of(context).size;
    final double _logoPositioned = size.height * 0.08;
    final double _leftPositioned = size.width / 2 - 100.0;
    final double _buttonPosition = size.width * 0.1;
    final double _customVerticalPosition = size.height / 2 - 100;
    double whiteContainerHeight = size.height * 0.4;
    double containerWidth = size.width * 0.9;
    //double formHeight = _controller.isCompleted ? whiteContainerHeight * 0.8 : 20.0;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width, 
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      height: whiteContainerHeight,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.slowMiddle,
                        width: containerWidth,
                        height: _controller.isCompleted ? whiteContainerHeight * 0.8 : 40.0,
                        child: CustomForm(containerWidth: containerWidth),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: (0 + _controller.value * 300)
                        .clamp(0, whiteContainerHeight),
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(45 * _controller.value),
                          ),
                          child: CustomPageView(),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(45 * _controller.value),
                          ),
                          child: FondoOpacidad(
                            opacity: 0.2 + (_controller.value * 0.2),
                          ),
                        ),
                      ],
                    ),
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

                  _controller.isCompleted
                  ? TitleSubtitle(whiteContainerHeight: whiteContainerHeight)
                  : SizedBox.shrink(),

                  Positioned(
                    top: (_logoPositioned + 60) + 50 * _controller.value,
                    left: (_leftPositioned) + 100.0,
                    child: OutLogo(),
                  ),
                  Positioned(
                    top: size.height / 2 - 100,
                    left: size.width * 0.1,
                    child: AnimatedOpacity(
                      duration: duration,
                      opacity: 1 - _controller.value,
                      child: Text(
                        "Photo by Miguel Fuentes\n on Splash",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.1,
                    bottom: _customVerticalPosition,
                    child: AnimatedOpacity(
                      duration: duration,
                      opacity: 1 - _controller.value,
                      child: WelcomeText(),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.1,
                    left: _buttonPosition,
                    right: _buttonPosition,
                    child: AnimatedOpacity(
                      duration: duration,
                      opacity: 1 - _controller.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SnakeButton(
                            onTap: () {
                              setState(() {
                                print("Tap");
                                isOpened = true;
                              });
                              _controller.forward();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                "Iniciar Sesión",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            borderWidth: 2.0,
                            snakeColor: primaryColor,
                          ),
                          SnakeButton(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                "Crear Cuenta",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            borderWidth: 2.0,
                            snakeColor: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle(
      {Key key,
      @required this.whiteContainerHeight,
      this.texto = "Iniciar sesión"})
      : super(key: key);

  final double whiteContainerHeight;
  final String texto;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double _centeredTitle = size.width / 2 - size.width / 4;

    return Positioned(
      bottom: whiteContainerHeight,
      left: _centeredTitle,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          width: size.width / 2,
          child: Column(
            children: [
              Text(
                texto,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.0),
              Text(
                "Deliza para ir hacia atrás",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
