import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/reminders_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddNewAppointment extends StatefulWidget {
  const AddNewAppointment({super.key});

  @override
  State<AddNewAppointment> createState() => _AddNewAppointmentState();
}

class _AddNewAppointmentState extends State<AddNewAppointment> {
  String? value;
  DateTime date = DateTime(3000, 2, 1, 10, 20);
  DateTime time = DateTime(3000, 2, 1, 10, 20);

  final docName = TextEditingController();
  final location = TextEditingController();
  final specialization = TextEditingController();
  final phone = TextEditingController(); //numbers
  final PageController pageController = PageController();

  int _currentIndex = 0;

  final List<String> titles = [
    'GENERAL DETAILS',
    'PLANNING',
    'CONFIRM',
  ];

  //save doc in firebase
  Future<void> DoctorData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final String userId = user.uid;

      await firestore
          .collection('users')
          .doc(userId)
          .collection('doctors')
          .add({
        'doc name': docName,
        'specialization': specialization,
        'location': location,
        'phone': phone,
      });

      firestore
          .collection('users')
          .doc(userId)
          .collection('appointments')
          .add({});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add a new Appointment"),
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Doctor name
                              const Text(
                                'Doctor Name',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: docName,
                                decoration: InputDecoration(
                                  hintText: 'Doctor Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //Specialization
                              const Text(
                                'Specialization',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: specialization,
                                decoration: InputDecoration(
                                  hintText: 'Doctor Specialization',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //phone number
                              const Text(
                                'Phone Number',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: phone,
                                decoration: InputDecoration(
                                  hintText: 'Doctor Phone Number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              //location
                              const Text(
                                'Location',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: location,
                                decoration: InputDecoration(
                                  hintText: 'Doctor Location',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                          //button
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
                                  if (docName.text.isEmpty ||
                                      specialization.text.isEmpty) {
                                    // Show an error message if any field is empty
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Please fill all details')),
                                    );
                                  } else if (_currentIndex < 2) {
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
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //planning
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //date
                            const Text(
                              'DATE',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) => SizedBox(
                                    height: 250,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime: date,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() => date = newTime);
                                      },
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' $date',
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
                            const SizedBox(
                              height: 30,
                            ),
                            //time
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'TIME',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) => SizedBox(
                                    height: 250,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime: time,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() => time = newTime);
                                      },
                                      use24hFormat: false,
                                      mode: CupertinoDatePickerMode.time,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' $time',
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
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    //confirm
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                                'You have an appointment with Dr ${docName.text}'),
                            Text("Specialization: ${specialization.text}"),
                            Text("Phone Number: ${phone.text}"),
                            Text("Location: ${location.text}"),
                            Text("Date: ${date}"),
                            Text("Time: ${time}"),
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

                              // Move to the next screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Reminders()));
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
                        const SizedBox(
                          height: 10,
                        )
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