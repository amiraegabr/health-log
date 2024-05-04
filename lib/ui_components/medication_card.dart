import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Medication medication;
  final List<Medication> medications;

  const MedicineCard(
      {super.key, required this.medication, required this.medications});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                medication.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '${medication.type} - Every ${medication.frequencyDays} days,\n ${medication.frequencyTimes} times per day',
                style: TextStyle(fontSize: 16),
              ),
              trailing: PopupMenuButton<String>(
                  onSelected: (String value) {
                    if (value == 'Edit') {
                      // Add code to edit the medication
                    } else if (value == 'Delete') {
//delete
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<String>(
                          value: 'Delete',
                          child: Text('Delete'),
                        ),
                      ]),
            )),
      ),
    );
  }
}

class Medication {
  final String name;
  final String type;
  final int frequencyDays;
  final int frequencyTimes;

  Medication({
    required this.name,
    required this.type,
    required this.frequencyDays,
    required this.frequencyTimes,
  });

  factory Medication.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Medication(
      name: data['name'] as String,
      type: data['type'] as String,
      frequencyDays: data['frequency_days'] as int,
      frequencyTimes: data['frequency_times'] as int,
    );
  }
}