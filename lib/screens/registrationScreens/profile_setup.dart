import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../ui_components/navigation_bar.dart';
import '../../ui_components/registration_button.dart';
import '../../ui_components/registration_input.dart';
import 'login.dart';
import '../../ui_components/registrationAppBar.dart';

class ProfileSetUp extends StatefulWidget {
  const ProfileSetUp({super.key});

  @override
  State<ProfileSetUp> createState() => _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
  //text editing controllers
  final emailController = TextEditingController();

  //details controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();
  final picker = ImagePicker();

  File? _image;

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
                  Text("WELCOME TO HEALTH LOG!",
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "LET'S SET UP YOUR ACCOUNT",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 10,
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
                          //fetch name from database
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(),
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
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
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