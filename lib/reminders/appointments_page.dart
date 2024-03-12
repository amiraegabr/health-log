import 'package:flutter/material.dart';
import 'package:healthlog/reminders/calender.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override

  // bool? status = false;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Calendar(),
      ],
    );
  }
}