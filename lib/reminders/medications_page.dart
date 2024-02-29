import 'package:flutter/material.dart';
import 'package:healthlog/reminders/calender.dart';

class MedicationsPage extends StatefulWidget {
  const MedicationsPage({super.key});

  @override
  State<MedicationsPage> createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {
  @override

  bool? status = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Calendar(),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(177, 221, 213, 1),
            ),
            // width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Medications for today:',
                      style: TextStyle(fontSize: 20),
                    ),
                    CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: const Color(0xFF129A7F),
                        title: const Text(
                          'Vitamin D',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val!;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: const Color(0xFF129A7F),
                        title: const Text(
                          'Vitamin D',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val!;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        checkColor: const Color(0xFF129A7F),
                        title: const Text(
                          'Vitamin D',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val!;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}