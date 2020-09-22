import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

import 'CategoriesContainer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle estiloTexto = TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  );

    return Positioned(
      top: kToolbarHeight * 2.5,
      right: homePadding,
      left: homePadding,
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
                Icon(
                  Icons.grid_on,
                  color: Colors.white
                ),
                Text(
                  "Vista",
                  style: estiloTexto,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
