import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'RowTextInformation.dart';

class SiteInformation extends StatelessWidget {
  const SiteInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.facebook,
                color: primaryColor,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.instagram,
                color: primaryColor,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.twitter,
                color: primaryColor,
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        RowTextInformation(),
      ],
    );
  }
}