import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final controller;
  final String label;
  final bool obscureText;
  final Icon? suffIcon;

  InputTextField({super.key, this.controller, required this.label, required this.obscureText, this.suffIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffIcon,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                Theme.of(context).primaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                Theme.of(context).splashColor)),
        floatingLabelStyle:TextStyle(color:
        Theme.of(context).primaryColor) ,
      ),
    );
  }
}