import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final controller;
  final String label;
  final Icon? preIcon;

  const InputTextField({super.key, this.controller, required this.label, this.preIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: preIcon,
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