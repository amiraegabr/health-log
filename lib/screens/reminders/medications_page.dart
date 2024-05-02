import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/calender.dart';
import 'package:healthlog/ui_components/medicine_card.dart';

class MedicationsPage extends StatefulWidget {
  const MedicationsPage({super.key});

  @override
  _MedicationsPageState createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {
  List<String> medications = [
    'Vitamin D',
    'Ibuprofen',
    'Multivitamin',
  ];
  List<bool> medicationStatus = [];

  @override
  void initState() {
    super.initState();
    medicationStatus = List.filled(medications.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // const Calendar(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(177, 221, 213, 1),
            ),
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
                    for (int i = 0; i < medications.length; i++)
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        checkColor: const Color(0xFF129A7F),
                        title: Text(
                          medications[i],
                          style: const TextStyle(fontSize: 20),
                        ),
                        value: medicationStatus[i],
                        onChanged: (val) {
                          setState(() {
                            medicationStatus[i] = val!;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
          MedicineCard(title: "Medicine Name"),
        ],
      ),
    );
  }
}
