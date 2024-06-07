import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final List<Appointment> appointments;

  const AppointmentCard(
      {super.key, required this.appointment, required this.appointments});

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appointment.docName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'Edit') {
                        // Add code to edit the appointment
                      } else if (value == 'Delete') {
                        //delete
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 5,),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(width: 5,),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specialization: ${appointment.specialization}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Location: ${appointment.location}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Phone: ${appointment.phone}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Date: ${appointment.date.day}/${appointment.date.month}/${appointment.date.year}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Time: ${appointment.time.hour}:${appointment.time.minute}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Appointment {
  final String docName;
  final String specialization;
  final String location;
  final int phone;
  final DateTime date;
  final DateTime time;

  Appointment({
    required this.docName,
    required this.specialization,
    required this.location,
    required this.phone,
    required this.date,
    required this.time,
  });

  factory Appointment.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Appointment(
      docName: data['doc_name'] as String,
      specialization: data['specialization'] as String,
      location: data['location'] as String,
      phone: data['phone'] as int,
      date: (data['date'] as Timestamp).toDate(),
      time: (data['time'] as Timestamp).toDate(),
    );
  }
}