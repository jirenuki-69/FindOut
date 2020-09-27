import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ListViewUsuarios.dart';
import 'SiteInformation.dart';

class Social extends StatelessWidget {
  const Social({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: size.height * 0.65,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double informationContainerHeight = constraints.maxHeight * 0.25;
          double radius = 25;

          return Stack(
            children: [
              Positioned(
                top: informationContainerHeight / 2,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.only(top: radius + 20, left: 15),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Text(
                        "Fotos de usuarios",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 20),
                      ListViewUsuarios(),
                      Text(
                        "Opiniones",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Container(height: 500)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeInOut,
                  height: informationContainerHeight,
                  width: constraints.maxWidth * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 20.0, bottom: 20.0, right: 20.0),
                  child: SiteInformation(),
                ),
              ),
              Positioned(
                top: informationContainerHeight - radius,
                right: size.width / 2 - radius,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: radius,
                  child: Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
