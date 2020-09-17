import 'package:findout/constants/constants.dart';

class Background {
  int id;
  String imagen;

  Background(
    {
    this.id,
    this.imagen
    }
  );
}

List<Background> backgrounds = [
  Background(
    id: 1,
    imagen: "$imgPath/fondo1.jpg",
  ),
  Background(
    id: 2,
    imagen: "$imgPath/fondo2.jpg",
  ),
  Background(
    id: 3,
    imagen: "$imgPath/fondo3.jpeg",
  ),
];