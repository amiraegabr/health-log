import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final controller;
  final String label;
  bool obscureText = false;
  final Icon? suffIcon;
  final Icon? preIcon;

  InputTextField({super.key, this.controller, required this.label, required this.obscureText, this.suffIcon, this.preIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffIcon,
        icon: preIcon,
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