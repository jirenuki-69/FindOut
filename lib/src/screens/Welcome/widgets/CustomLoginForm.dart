import 'package:findout/constants/constants.dart';
import 'package:findout/src/screens/Home/home.dart';
import 'package:flutter/material.dart';

import 'CustomTextField.dart';
import 'SubmitButton.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    Key key,
    @required this.containerWidth,
  }) : super(key: key);

  final double containerWidth;

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 650),
        pageBuilder: (context, animation1, animation2) {
          
          animation1 = CurvedAnimation(
            parent: animation1,
            curve: Curves.elasticInOut,
          );
          return ScaleTransition(
            scale: animation1,
            child: HomePage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomTextField(
              containerWidth: containerWidth,
              icon: "$iconPath/login_user.png",
              hintText: "Usuario",
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            CustomTextField(
              containerWidth: containerWidth,
              icon: "$iconPath/lock.png",
              hintText: "Contraseña",
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            Text("¿Olvidaste tu contraseña?",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
            SizedBox(height: 20),
            SubmitButton(
              text: "Iniciar Sesión",
              onPressed: () => _navigateToHome(context),
            ),
          ],
        ),
      ),
    );
  }
}
