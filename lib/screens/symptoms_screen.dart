import 'package:flutter/material.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptom checker"),
      ),
      body: Column(
        children: [
          Text("Hope you feel well"),
          Text("Hope you feel well"),
          Text("Hope you feel well"),
          Text("Hope you feel well"),
        ],
      ),
    );
  }
}