import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/reminders_screen.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddNewAppointment extends StatefulWidget {
  const AddNewAppointment({super.key});

  @override
  State<AddNewAppointment> createState() => _AddNewAppointmentState();
}

class _AddNewAppointmentState extends State<AddNewAppointment> {
  final DateTime initialDate = DateTime(2024, 2, 1, 10, 20);
  final DateTime initialTime = DateTime(2024, 2, 1, 10, 20);

  DateTime date = DateTime(2024, 2, 1,10, 20);
  DateTime time = DateTime(2024, 2, 1, 10, 20);

  final docNameController = TextEditingController();
  final locationController = TextEditingController();
  final specializationController = TextEditingController();
  final phoneController = TextEditingController();
  final pageController = PageController();

  int _currentIndex = 0;

  final List<String> titles = [
    'GENERAL DETAILS',
    'PLANNING',
    'CONFIRM',
  ];

  Future<void> saveDoctorData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final String userId = user.uid;

      await firestore.collection('users').doc(userId).collection('doctors').add({
        'doc_name': docNameController.text,
        'specialization': specializationController.text,
        'location': locationController.text,
        'phone': phoneController.text,
      });

      await firestore.collection('users').doc(userId).collection('appointments').add({
        'doc_name': docNameController.text,
        'specialization': specializationController.text,
        'location': locationController.text,
        'phone': phoneController.text,
        'date': date,
        'time': time,
      });
    }
  }

  Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Theme.of(context).cardColor,
            filled: true,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
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
                  const SizedBox(height: 30),
                  Text(
                    titles[_currentIndex],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    buildGeneralDetailsPage(),
                    buildPlanningPage(),
                    buildConfirmPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGeneralDetailsPage() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                label: 'Doctor Name',
                hint: 'Doctor Name',
                controller: docNameController,
              ),
              buildTextField(
                label: 'Specialization',
                hint: 'Doctor Specialization',
                controller: specializationController,
              ),
              buildTextField(
                label: 'Phone Number',
                hint: 'Doctor Phone Number',
                controller: phoneController,
              ),
              buildTextField(
                label: 'Location',
                hint: 'Doctor Location',
                controller: locationController,
              ),
              const SizedBox(height: 25),
            ],
          ),
          buildNavigationButton(
            context: context,
            label: "Next",
            onPressed: () {
              if (docNameController.text.isEmpty ||
                  specializationController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill all details')),
                );
              } else if (_currentIndex < 2) {
                pageController.animateToPage(
                  _currentIndex + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildPlanningPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DATE',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
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
              child: buildDateTimePicker(
                context: context,
                label: DateFormat('yyyy-MM-dd').format(date),
              ),
            ),
            const SizedBox(height: 30),
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
              child: buildDateTimePicker(
                context: context,
                label: DateFormat('HH:mm').format(time),
              ),
            ),
          ],
        ),
        Divider(
          indent: 60,
          endIndent: 60,
          color: Theme.of(context).splashColor,
        ),
        buildNavigationButton(
          context: context,
          label: "Next",
          onPressed: () {
            if (_currentIndex < 2) {
              pageController.animateToPage(
                _currentIndex + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildConfirmPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('You have an appointment with Dr ${docNameController.text}'),
            Text("Specialization: ${specializationController.text}"),
            Text("Phone Number: ${phoneController.text}"),
            Text("Location: ${locationController.text}"),
            Text("Date: ${DateFormat('yyyy-MM-dd').format(date)}"),
            Text("Time: ${DateFormat('HH:mm').format(time)}"),
          ],
        ),
        buildNavigationButton(
          context: context,
          label: "Continue",
          onPressed: () async {
            await saveDoctorData();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Reminders(initialTabIndex: 1,),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildDateTimePicker({
    required BuildContext context,
    required String label,
  }) {
    return Container(
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
              label,
              style: const TextStyle(fontSize: 18),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      constraints: const BoxConstraints.tightForFinite(
        width: 200,
        height: 60,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).splashColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}