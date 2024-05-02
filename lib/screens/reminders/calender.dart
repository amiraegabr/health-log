import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  DateTime focusedDay = DateTime.now();

  void _onDaySelected(DateTime day) {
    setState(() {
      focusedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminders')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030),
            onDaySelected: _onDaySelected,
            calendarFormat: CalendarFormat.twoWeeks,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, focusedDay),
          ),
          // Add other widgets for reminders here
        ],
      ),
    );
  }
}
