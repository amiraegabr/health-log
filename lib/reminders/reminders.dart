import 'package:flutter/material.dart';
import 'package:healthlog/reminders/appointments_page.dart';
import 'package:healthlog/reminders/medications_page.dart';
import 'package:healthlog/settings.dart';
import '../add_medication.dart';


class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  bool? status = false;
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reminders"),
          // leading: IconButton(
          //     onPressed: () {}, icon: (const Icon(Icons.arrow_back_ios))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
              },
            ),
          ],
          bottom: TabBar(
              // physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: Theme.of(context).primaryColor,
              indicator: BoxDecoration(
                // borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).splashColor,
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
                          width: 1),
                    ),
                    // color: Theme.of(context).primaryColor,
                    // ),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text("Medications")),
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
                          width: 1),
                      // color: Theme.of(context).primaryColor,
                    ),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text("Appointments")),
                  ),
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Add_Medication(),
              ),
            );
          },
          backgroundColor: const Color(0xFF129A7F),
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
          children: [
            MedicationsPage(),
            AppointmentsPage(),
          ],
        ),
      ),
    );
  }
}