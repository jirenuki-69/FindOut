import 'package:flutter/material.dart';

//Strings
const String imgPath = "lib/assets/img";
const String iconPath = "lib/assets/icons";
const double homePadding = 30.0;

//Colores
final primaryColor = Color(0xFFFF256C);
final lightPrimaryColor = Color(0XFFFED1E6);
final LinearGradient gradient = LinearGradient(
  colors: <Color>[
    primaryColor,
    lightPrimaryColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.5, 1.0],
);