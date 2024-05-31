import 'package:flutter/material.dart';

class PassInputTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function obscureTextToggle;
  final Icon? preIcon;

  const PassInputTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.obscureTextToggle,
    this.preIcon,
  });

  @override
  _PassInputTextFieldState createState() => _PassInputTextFieldState();
}

class _PassInputTextFieldState extends State<PassInputTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
            widget.obscureTextToggle();
          },
          child: Icon(
            obscureText ? Icons.visibility :
            Icons.visibility_off,
            size: 20,
          ),
        ),
        prefixIcon: const Icon(Icons.lock_open_rounded),
        helperText: "Password must be 6 characters or longer",
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).splashColor)),
        floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}