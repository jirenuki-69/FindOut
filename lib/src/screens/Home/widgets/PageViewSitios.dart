import 'dart:async';

import 'package:findout/src/models/Sitio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageViewSitios extends StatefulWidget {
  PageViewSitios({Key key, @required this.sitio}) : super(key: key);
  Sitio sitio;

  @override
  _PageViewSitiosState createState() => _PageViewSitiosState();
}

Timer _timer;
PageController _pageController;
int currentIndex = 0;

class _PageViewSitiosState extends State<PageViewSitios> {

  @override
  void initState() {
    _pageController = PageController( keepPage: false, initialPage: 0 );
    _timer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
        currentIndex = currentIndex == widget.sitio.images.length - 1 ? 0 : currentIndex + 1;
        _pageController.animateToPage(currentIndex, duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
     });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return PageView.builder(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.sitio.images.length,
      itemBuilder: (context, _) {
        return Container(
          width: size.width,
          height: size.height,
          child: Image(
            //placeholder: AssetImage("$imgPath/loading.gif"),
            image: AssetImage(widget.sitio.images[currentIndex]),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}