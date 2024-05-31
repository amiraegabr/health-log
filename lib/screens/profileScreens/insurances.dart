import 'package:flutter/material.dart';

class Insurances extends StatelessWidget {
  const Insurances({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insurances"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Insurances",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildInsuranceCard(
                    companyName: "Company A",
                    policyNumber: "123456789",
                    expiryDate: "2024-12-31",
                  ),
                  _buildInsuranceCard(
                    companyName: "Company B",
                    policyNumber: "987654321",
                    expiryDate: "2025-06-30",
                  ),
                  // Add more insurance cards here
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Insurance"),
                onPressed: () {
                  // Navigate to the add insurance screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsuranceCard({
    required String companyName,
    required String policyNumber,
    required String expiryDate,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          companyName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Policy Number: $policyNumber"),
            Text("Expiry Date: $expiryDate"),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            // Handle menu selection
            if (value == 'edit') {
              // Navigate to edit insurance screen
            } else if (value == 'delete') {
              // Handle delete insurance
            }
          },
          itemBuilder: (BuildContext context) {
            return {'edit', 'delete'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}