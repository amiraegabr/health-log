import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {

  final Function()? onTap;
  final String label;

  const RegistrationButton({super.key, this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).splashColor,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    )
    ;
  }
}