import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/appointments_page.dart';
import 'package:healthlog/screens/reminders/medications_page.dart';
import 'package:healthlog/screens/settings.dart';
import 'package:healthlog/utils/constants.dart';
import 'add_medication.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  DateTime selectedDate = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reminders"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
              },
            ),
          ],
          bottom: TabBar(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: kPrimaryColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kSplashColor,
            ),
            tabs: [
              Tab(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 168, 115, 1),
                      width: 1,
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Medications"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 168, 115, 1),
                      width: 1,
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Appointments"),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMedication(),
              ),
            );
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),
        ),
        body: TabBarView(
          children: [
            MedicationsPage(selectedDate: selectedDate),
            AppointmentsPage(),
          ],
        ),
      ),
    );
  }
}
