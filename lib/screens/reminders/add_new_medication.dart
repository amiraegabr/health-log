import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/reminders_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class AddNewMedication extends StatefulWidget {
  AddNewMedication({super.key});

  @override
  State<AddNewMedication> createState() => _AddNewMedicationState();
}

class _AddNewMedicationState extends State<AddNewMedication> {
  int _selectedDays = 1;
  int _selectedTimes = 1;
  String? value;
  String? medType;
  final name = TextEditingController();

  DateTime? _selectedDate;

  final PageController pageController = PageController();

  int _currentIndex = 0;

  final List<String> titles = [
    'GENERAL DETAILS',
    'PLANNING',
    'CONFIRM',
  ];

  //save in firebase
  Future<void> saveMedicineData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final String userId = user.uid;

      await firestore.collection('users').doc(userId).collection('medications').add({
        'name': name.text,
        'type': medType,
        'frequency_days': _selectedDays,
        'frequency_times': _selectedTimes,
        // 'reminder_date': _selectedDate,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add a new Medication"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Center(
          child: Column(
            children: [
              //dot indicator
              Column(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).splashColor,
                      dotColor: Theme.of(context).cardColor,
                      dotHeight: 16,
                      dotWidth: 35,
                      spacing: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    titles[_currentIndex],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //page content
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    //general details
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Med name
                            const Text(
                              'Medication type',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                hintText: 'Medication Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Theme.of(context).cardColor,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            //Med type
                            const Text(
                              'Medication type',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //type list
                            Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).cardColor,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    RadioListTile(
                                        title: const Text('Capsule'),
                                        value: 'Capsule',
                                        groupValue: medType,
                                        onChanged: (value) {
                                          setState(() {
                                            medType = value;
                                          });
                                        }),
                                    RadioListTile(
                                        title: const Text('Tablet'),
                                        value: 'Tablet',
                                        groupValue: medType,
                                        onChanged: (value) {
                                          setState(() {
                                            medType = value;
                                          });
                                        }),
                                    RadioListTile(
                                        title: const Text('Liquid'),
                                        value: 'Liquid',
                                        groupValue: medType,
                                        onChanged: (value) {
                                          setState(() {
                                            medType = value;
                                          });
                                        }),
                                    RadioListTile(
                                        title: const Text('Drops'),
                                        value: 'Drops',
                                        groupValue: medType,
                                        onChanged: (value) {
                                          setState(() {
                                            medType = value;
                                          });
                                        }),
                                    RadioListTile(
                                        title: const Text('Other'),
                                        value: 'Other',
                                        groupValue: medType,
                                        onChanged: (value) {
                                          setState(() {
                                            medType = value;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                            //button
                          ],
                        ),
                        Container(
                            constraints: const BoxConstraints.tightForFinite(
                              width: 200,
                              height: 60,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).splashColor,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (name.text.isEmpty) {
                                  // Show an error message if the name is empty
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please enter a medication name')),
                                  );
                                } else if (medType == null) {
                                  // Show an error message if the medication type is not selected
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please select a medication type')),
                                  );
                                } else if (_currentIndex < 2) {
                                  pageController.animateToPage(
                                    _currentIndex + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    //planning
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'HOW OFTEN ?',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // Return a Container with a CupertinoPicker
                                    return Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // Background color of the picker
                                        borderRadius: BorderRadius.circular(12),
                                        // Rounded corners
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: CupertinoPicker(
                                        itemExtent: 40,
                                        // Callback when the picker item changes
                                        onSelectedItemChanged: (index) {
                                          // Update selected days value
                                          setState(() {
                                            _selectedDays = index + 1; // Adding 1 as index starts from 0
                                          });
                                        },
                                        // Generate list of items for the picker
                                        children: List.generate(30, (index) {
                                          return Center(
                                            // Display numbers from 1 to 30 vertically
                                            child: Text(
                                              '${index + 1}',
                                              // Display numbers from 1 to 30
                                              style: const TextStyle(fontSize: 20),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'EVERY  $_selectedDays DAYS',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'HOW MANY TIMES A DAY ?',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // Return a Container with a CupertinoPicker
                                    return Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // Background color of the picker
                                        borderRadius: BorderRadius.circular(12.0),
                                        // Rounded corners
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: CupertinoPicker(
                                        itemExtent: 40,
                                        // Callback when the picker item changes
                                        onSelectedItemChanged: (index) {
                                          // Update selected days value
                                          setState(() {
                                            _selectedTimes = index + 1; // Adding 1 as index starts from 0
                                          });
                                        },
                                        // Generate list of items for the picker
                                        children: List.generate(10, (index) {
                                          return Center(
                                            // Display numbers from 1 to 30 vertically
                                            child: Text(
                                              '${index + 1}',
                                              // Display numbers from 1 to 30
                                              style: const TextStyle(fontSize: 20),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' $_selectedTimes TIMES PER DAY',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                         Divider(
                          indent: 60,
                          endIndent: 60,
                          color: Theme.of(context).splashColor,
                        ),
                        Container(
                          constraints: const BoxConstraints.tightForFinite(
                            width: 200,
                            height: 60,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).splashColor,
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                if (_currentIndex < 2) {
                                  pageController.animateToPage(
                                    _currentIndex + 1,
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                    //confirm
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(name.text),
                            Text("Medicine type: $medType"),
                            Text("Medicine frequency: Every $_selectedDays days, $_selectedTimes times per day"),
                          ],
                        ),

                        Container(
                          constraints: const BoxConstraints.tightForFinite(
                            width: 200,
                            height: 60,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).splashColor,
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              //save to database
                              await saveMedicineData();
                              // Move to the next screen
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Reminders()));
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Add a new step for calendar selection
// Column(
// children: [
// Text(
// 'SELECT REMINDER DATE',
// style: TextStyle(fontSize: 18),
// ),
// SizedBox(height: 10),
// TableCalendar(
// focusedDay: _selectedDate?? DateTime.now(),
// firstDay: DateTime.utc(2020),
// lastDay: DateTime.utc(2030),
// onDaySelected: (day, focusedDay) {
// setState(() {
// _selectedDate = day;
// });
// },
// calendarFormat: CalendarFormat.twoWeeks,
// headerStyle: HeaderStyle(
// formatButtonVisible: false,
// ),
// availableGestures: AvailableGestures.all,
// selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
// ),
// ],
// ),