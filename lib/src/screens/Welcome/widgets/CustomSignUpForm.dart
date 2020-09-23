import 'package:findout/constants/constants.dart';
import 'package:findout/src/screens/Welcome/widgets/CustomPasswordField.dart';
import 'package:flutter/material.dart';
import 'CustomTextField.dart';
import 'SubmitButton.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({
    Key key,
    @required this.containerWidth,
  }) : super(key: key);

  final double containerWidth;

  @override
  _CustomSignUpFormState createState() => _CustomSignUpFormState();
}
bool isChecked = false;

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomTextField(containerWidth: widget.containerWidth, icon: "$iconPath/login_user.png", hintText: "Usuario", onChanged: (value) {}, ),
            SizedBox(height: 20),
            CustomPasswordField(containerWidth: widget.containerWidth, icon: "$iconPath/lock.png", hintText: "Contraseña", onChanged: (value) {}, ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isChecked, 
                  onChanged: (val) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  activeColor: primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Aceptar ",
                          style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: "Términos y condiciones",
                          style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SubmitButton(text: "Crear Cuenta", onPressed: () {},),
          ],
        ),
      ),
    );
  }
}