import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

import 'CategoriesContainer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    Key key,
    @required this.duration,
    @required this.isInitaded,
  }) : super(key: key);

  final Duration duration;
  final bool isInitaded;

  @override
  Widget build(BuildContext context) {
    final TextStyle estiloTexto = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

    return AnimatedPositioned(
      duration: duration,
      curve: Curves.elasticInOut,
      top: kToolbarHeight * 2.5,
      right: isInitaded ? homePadding : 0,
      left: isInitaded ? homePadding : 0,
      child: AnimatedOpacity(
        duration: const Duration( milliseconds: 300 ),
        opacity: isInitaded ? 1 : 0,
        curve: Curves.slowMiddle,
        child: Row(
          children: [
            CategoriesContainer(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buscar Categoría",
                    style: estiloTexto,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            CategoriesContainer(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.grid_on, color: Colors.white),
                  Text(
                    "Vista",
                    style: estiloTexto,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
