import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/ui_components/navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../../ui_components/registration_button.dart';
import '../../ui_components/registrationAppBar.dart';
import '../../ui_components/registration_input.dart';


class ProfileSetUp extends StatefulWidget {
  const ProfileSetUp({super.key});

  @override
  State<ProfileSetUp> createState() => _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
  //fetch user account
  final user = FirebaseAuth.instance.currentUser!;

  late String firstName ;
  late String lastName;

  //text editing controllers
  // TextEditingController birthDate = TextEditingController();
  late String birthDate;
  final age = TextEditingController();
  final picker = ImagePicker();

  File? _image;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          firstName = data['firstName'];
          lastName = data['lastName'];
        });
      } else {
        // User document not found
      }
    });
  }


  Future<void> selectDate() async{
    DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime(2060)
    );
    if (pickDate != null){
      setState(() {
        birthDate = pickDate.toString() ;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFB1DDD5),
      appBar: const RegistrationAppBar(),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //top part
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LET'S SETUP YOUR ACCOUNT",
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Some details to get you started",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            //main component
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          //add image
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  _image != null ? FileImage(_image!) : null,
                              child: _image == null
                                  ? const Icon(Icons.add_a_photo)
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 30),
                          //fetch names from database
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: screenSize.width/2.5,
                                child: Text(firstName),
                              ),
                              SizedBox(
                                width: screenSize.width/2.5,
                                child: Text(lastName),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          //birthdate
                          TextField(
                            // controller: birthDate,
                            decoration: const InputDecoration(
                              labelText: "Birthdate",
                              suffixIcon: Icon(Icons.calendar_month_rounded),
                            ),
                            onTap: ()  {
                            },
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          const TextField(),
                          const SizedBox(
                            height: 30,
                          ),
                          //more info to be added
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RegistrationButton(
                        label: "Continue",
                        onTap: () {
                          //add details to user profile
                          //continue to home screen
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AppNavigation()));
                        },
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Skip for now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}