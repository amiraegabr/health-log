import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../ui_components/medication_card.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  bool? status = false;
  List<Medication> medications = [];

  @override
  void initState() {
    super.initState();
    fetchMedications();
  }

  Future<void> fetchMedications() async {
    final user = FirebaseAuth.instance.currentUser;
    final userID = user?.uid;

    if (user != null) {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('medications')
          .get();
      setState(() {
        medications =
            querySnapshot.docs.map((doc) => Medication.fromDocument(doc))
                .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medications"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  if (medications.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: medications.length,
                        itemBuilder: (context, index) {
                          final medication = medications[index];
                          return MedicineCard(
                              medication: medication, medications: medications);
                        },
                      ),
                    ),
                ],
              ),
            ),
            // const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Medication"),
                onPressed: () {
                  // Navigate to the add medication screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}