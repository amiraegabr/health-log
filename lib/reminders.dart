import 'package:flutter/material.dart';
import 'add_medication.dart';
import 'package:table_calendar/table_calendar.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  bool? status = false;
  DateTime today= DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: (const Icon(Icons.arrow_back_ios))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const Add_Medication(),
            ),);
        },
        backgroundColor: const Color(0xFF129A7F),
        child: const Icon(Icons.add),

      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 80,
                color: Colors.white,
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  unselectedLabelColor: const Color(0xFF129A7F),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromRGBO(255, 168, 115, 1),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color.fromRGBO(255, 168, 115, 1), width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Medications'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color.fromRGBO(255, 168, 115, 1), width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text('Appointments'),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
            Expanded(
                child: TabBarView(
                    children: [
                      //med page
                      Column(
                          children: [
                            //calender
                            Container(
                              child: TableCalendar(
                                  calendarFormat: CalendarFormat.twoWeeks,
                                  onDaySelected: _onDaySelected,
                                  locale: "en_US",
                                  rowHeight: 35,
                                  headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                                  availableGestures: AvailableGestures.none,
                                  selectedDayPredicate: (day)=> isSameDay(day, today),
                                  focusedDay: today,
                                  firstDay: DateTime.utc(2020,1,1),
                                  lastDay: DateTime.utc(2030,1,1)),

                            ),
                            //checkboxes
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromRGBO(177, 221, 213, 1),),
                                width: double.infinity,
                                height: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Medications for today:', style: TextStyle(fontSize: 20),),
                                        CheckboxListTile(
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: const Color(0xFF129A7F),
                                            title: const Text('Vitamin D',style: TextStyle(fontSize: 20),),
                                            value: status,
                                            onChanged: (val) {
                                              setState(() {
                                                status = val!;
                                              });
                                            }
                                        ),
                                        CheckboxListTile(
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: const Color(0xFF129A7F),
                                            title: const Text('Vitamin D',style: TextStyle(fontSize: 20),),
                                            value: status,
                                            onChanged: (val) {
                                              setState(() {
                                                status = val!;
                                              });
                                            }
                                        ),
                                        CheckboxListTile(
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkColor: const Color(0xFF129A7F),
                                            title: const Text('Vitamin D',style: TextStyle(fontSize: 20),),
                                            value: status,
                                            onChanged: (val) {
                                              setState(() {
                                                status = val!;
                                              });
                                            }
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ),


                          ]),
                      //app page
                      Center(
                        child: Column(
                            children: [
                              //calender
                              Container(
                                child: TableCalendar(
                                    calendarFormat: CalendarFormat.twoWeeks,
                                    onDaySelected: _onDaySelected,
                                    locale: "en_US",
                                    rowHeight: 35,
                                    headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                                    availableGestures: AvailableGestures.none,
                                    selectedDayPredicate: (day)=> isSameDay(day, today),
                                    focusedDay: today,
                                    firstDay: DateTime.utc(2020,1,1),
                                    lastDay: DateTime.utc(2030,1,1)),

                              ),


                            ]),
                      ),
                    ]) ),



          ],
        ),

      ),
    );
  }
}

