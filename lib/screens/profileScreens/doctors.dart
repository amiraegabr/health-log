import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;

  Doctor({required this.name, required this.specialty});
}

class Doctors extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(name: 'John Doe', specialty: 'Cardiology'),
    Doctor(name: 'Jane Smith', specialty: 'Pediatrics'),
    Doctor(name: 'Mike Johnson', specialty: 'Neurology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return ListTile(
            title: Text(doctor.name),
            subtitle: Text(doctor.specialty),
          );
        },
      ),
    );
  }
}
