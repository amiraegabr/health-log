import 'package:flutter/material.dart';

class MedicalID extends StatelessWidget {
  final String userName;
  final String bloodType;
  final String allergies;
  final String chronicConditions;
  final String medications;

  const MedicalID({
    Key? key,
    required this.userName,
    required this.bloodType,
    required this.allergies,
    required this.chronicConditions,
    required this.medications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical ID"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Medical ID Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              icon: Icons.person,
              title: "Name",
              subtitle: userName,
            ),
            _buildInfoCard(
              icon: Icons.bloodtype,
              title: "Blood Type",
              subtitle: bloodType,
            ),
            _buildInfoCard(
              icon: Icons.warning,
              title: "Allergies",
              subtitle: allergies,
            ),
            _buildInfoCard(
              icon: Icons.healing,
              title: "Chronic Conditions",
              subtitle: chronicConditions,
            ),
            _buildInfoCard(
              icon: Icons.medical_services,
              title: "Medications",
              subtitle: medications,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 36),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}