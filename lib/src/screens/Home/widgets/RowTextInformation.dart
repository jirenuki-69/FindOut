import 'package:flutter/material.dart';

class RowTextInformation extends StatelessWidget {
  const RowTextInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextInformation(
              field: "Teléfono: ",
              text: "442 3890 469",
            ),
            TextInformation(
              field: "Servicio a domicilio: ",
              text: "No",
            ),
          ],
        ),
        SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextInformation(
              field: "Categoría: ",
              text: "Cocktails bar",
            ),
            TextInformation(
              field: "hora: ",
              text: "5:00 pm a 2:00am",
            ),
          ],
        ),
      ],
    );
  }
}

class TextInformation extends StatelessWidget {
  const TextInformation({
    Key key,
    @required this.field,
    @required this.text,
  }) : super(key: key);

  final String field;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: field,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ]
      ),
    );
  }
}