import 'package:flutter/material.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Records"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Medical Records",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMedicalRecordCard(
                    title: "Medical Record 1",
                    date: "2024-05-22",
                    description: "Description of Medical Record 1",
                  ),
                  _buildMedicalRecordCard(
                    title: "Medical Record 2",
                    date: "2024-05-23",
                    description: "Description of Medical Record 2",
                  ),
                  // Add more medical record cards here
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Medical Record"),
                onPressed: () {
                  // Navigate to the add medical record screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalRecordCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date: $date"),
            Text("Description: $description"),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Handle delete medical record
          },
        ),
      ),
    );
  }
}