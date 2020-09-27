import 'package:findout/static/imagenesUsuarios.dart';
import 'package:flutter/material.dart';

class ListViewUsuarios extends StatefulWidget {
  const ListViewUsuarios({
    Key key,
  }) : super(key: key);

  @override
  _ListViewUsuariosState createState() => _ListViewUsuariosState();
}

ScrollController _scrollController;

class _ListViewUsuariosState extends State<ListViewUsuarios> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,  
      child: ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: imagenesUsuarios.length,
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagenesUsuarios[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}