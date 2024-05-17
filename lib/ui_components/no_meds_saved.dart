import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/medications_page.dart';
import 'package:healthlog/screens/reminders/reminders_screen.dart';

class NoMedsCard extends StatelessWidget {
  const NoMedsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Reminders()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                spreadRadius: 4,
                offset: const Offset(10, 10),
              )
            ]),
        child: Column(
          children: [
            Image.asset(
              "assets/images/pills group.png",
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Set up Medications",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Save all your medications in one place. Set up your schedule and track what you need.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Reminders()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Add a medication", style: TextStyle(fontWeight: FontWeight.w500),),
                  )),
            )
          ],
        ),
      ),
    );
  }
}