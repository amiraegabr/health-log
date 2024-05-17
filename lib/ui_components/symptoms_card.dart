import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/symptoms_screen.dart';

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const SymptomsScreen(), // Replace with your desired screen
            ),          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                spreadRadius: 4,
                offset: Offset(10, 10),
              )
            ]
          ),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Not feeling well?",
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),
                  ),
                  Text("Let's figure out why.", style: TextStyle(fontSize: 18)),
                ],
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Questions.png",
                  height: 150,
                ),
              ),
            ],
          ),
        ),
    );
  }
}