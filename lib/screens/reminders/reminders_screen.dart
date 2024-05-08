import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/appointments_page.dart';
import 'package:healthlog/screens/reminders/medications_page.dart';
import 'package:healthlog/screens/settings.dart';

import 'add_new_appointment.dart';
import 'add_new_medication.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> with SingleTickerProviderStateMixin {
  bool? status = false;
  TabController? _tabController;
  int _currentIndex = 0;

  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _currentIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _handleFloatingActionButtonPressed() {
    if (_currentIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  AddNewMedication(),
        ),
      );
    } else if (_currentIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  AddNewAppointment(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminders"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.black,
          unselectedLabelColor: Theme.of(context).primaryColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).splashColor,
          ),
          tabs: [
            Tab(
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text("Medications",)),
              ),
            ),
            Tab(
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text("Appointments")),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleFloatingActionButtonPressed,
        backgroundColor: const Color(0xFF129A7F),
        child: const Icon(Icons.add),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MedicationsPage(),
          AppointmentsPage(),
        ],
      ),
    );
  }
}