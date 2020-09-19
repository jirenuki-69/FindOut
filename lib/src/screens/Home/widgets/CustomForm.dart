import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';

import 'CustomTextField.dart';
import 'SubmitButton.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key key,
    @required this.containerWidth,
  }) : super(key: key);

  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomTextField(containerWidth: containerWidth, icon: "$iconPath/login_user.png", hintText: "Usuario", onChanged: (value) {}, ),
            SizedBox(height: 20),
            CustomTextField(containerWidth: containerWidth, icon: "$iconPath/lock.png", hintText: "Contraseña", onChanged: (value) {}, ),
            SizedBox(height: 10),
            Text("¿Olvidaste tu contraseña?", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
            SizedBox(height: 20),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}