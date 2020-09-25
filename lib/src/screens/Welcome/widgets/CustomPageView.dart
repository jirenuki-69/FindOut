import 'dart:async';
import 'package:findout/static/backgrounds.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  CustomPageView({Key key,}) : super(key: key);

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

PageController _controller;
Timer _timer;
int index = 0;
const duration = const Duration(milliseconds: 450);

class _CustomPageViewState extends State<CustomPageView> {

  @override
  void initState() { 
    _controller = PageController( keepPage: false, initialPage: 0 );
    _timer = Timer.periodic(const Duration(milliseconds: 3000), (Timer t) { 

      index = index == backgrounds.length - 1 ? 0 : index + 1;
      _controller.animateToPage(index, duration: duration, curve: Curves.easeIn);
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

    return PageView.builder(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      itemCount: backgrounds.length,
      itemBuilder: (context, index) {
        return Image.asset(
          backgrounds[index].imagen,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
