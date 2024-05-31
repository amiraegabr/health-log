import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/reminders_screen.dart';

class NoAppsCard extends StatelessWidget {
  const NoAppsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reminders(initialTabIndex: 1)),
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
              "assets/images/events.png",
              height: 120,

            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add doctor appointments",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Set reminders for your doctors' appointments and never miss them again.",
              style: TextStyle(fontSize: 18),textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reminders(initialTabIndex: 1)),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Add a new appointment", style: TextStyle(fontWeight: FontWeight.w500),),
                  )),
            )
          ],
        ),
      ),
    );
  }
}