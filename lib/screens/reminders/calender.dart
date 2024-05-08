import 'package:flutter/material.dart';

// import 'package:healthlog/reminders/remindersAppBar.dart';
//
// class RemindersPage extends StatefulWidget {
//   const RemindersPage({super.key});
//
//   @override
//   State<RemindersPage> createState() => _RemindersPageState();
// }
//
// class _RemindersPageState extends State<RemindersPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: RemindersAppBar(),
//       body: TabBarView(
//         children: [
//
//         ],
//       ),
//     );
//   }
// }

import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: today,
      firstDay: DateTime.utc(2020),
      lastDay: DateTime.utc(2030),
      onDaySelected: _onDaySelected,
      calendarFormat: CalendarFormat.twoWeeks,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, today),

    );
  }
}