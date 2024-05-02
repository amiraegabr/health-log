import 'package:flutter/material.dart';

class InsurancesScreen extends StatelessWidget {
  const InsurancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurances'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add insurance functionality here
              },
              child: Text('Add Insurance'),
            ),
          ],
        ),
      ),
    );
  }
}
