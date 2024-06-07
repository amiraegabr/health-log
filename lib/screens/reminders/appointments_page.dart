import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/calender.dart';
import '../../ui_components/appointment_card.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  bool? status = false;
  List<Appointment> appointments = [];

  Future<void> fetchAppointments() async {
    final user = FirebaseAuth.instance.currentUser;
    final userID = user?.uid;

    if (user != null) {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('appointments')
          .get();
      appointments = querySnapshot.docs.map((doc) => Appointment.fromDocument(doc)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Calendar(),
        const SizedBox(height: 10),
        FutureBuilder(
          future: fetchAppointments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (appointments.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      final appointment = appointments[index];
                      return AppointmentCard(appointment: appointment, appointments: appointments);
                    },
                  ),
                );
              } else {
                return Center(child: Text('No appointments'));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}