import 'package:flutter/material.dart';

class MedicalID extends StatelessWidget {
  const MedicalID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("USERNAME"),
          Text("DATE OF BIRTH"),
          Text("AGE"),
          Text("GENDER"),
          Text("BLOOD TYPE"),
          Text("ALLERGIES"),
          Text("CHRONIC ILLNESS"),
        ],
      ),
    );
  }
}