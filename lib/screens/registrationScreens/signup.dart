import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/registrationScreens/profile_setup.dart';
import 'package:healthlog/ui_components/navigation_bar.dart';
import '../../ui_components/registration_button.dart';
import '../../ui_components/registration_input.dart';
import '../../ui_components/registration_password_input.dart';
import 'login.dart';
import '../../ui_components/registrationAppBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = false;

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  //details controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  //dispose of input
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmedPasswordController.dispose();
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }

  //sign user in
  void SignUserUp() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //check password match
    if (passwordController.text != confirmedPasswordController.text) {
      Navigator.pop(context);
      PassErrorMessage();
    } else {
      //passwords match
      try {
        // creating user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // user details
        await FirebaseFirestore.instance.collection('users').add({
          'email': emailController.text,
          'firstName': firstName.text,
          'lastName': lastName.text,
        });
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AppNavigation()));
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          SignedErrorMessage();
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        }
      }
    }
  }

  void PassErrorMessage() => showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            title: Text("passwords dont match"),
          ));

  void SignedErrorMessage() => showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            title: Text("You already have an account \n Try signing in"),
          ));

  void EmptyErrorMessage() => showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            title: Text("Please fill in all feilds to continue"),
          ));

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFB1DDD5),
      appBar: const RegistrationAppBar(),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    height: 30,
                  ),
                ],
              ),
            ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: screenSize.width / 2.5,
                                child: InputTextField(
                                  controller: firstName,
                                  label: "First Name",
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width / 2.5,
                                child: InputTextField(
                                  controller: lastName,
                                  label: "Last Name",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InputTextField(
                            controller: emailController,
                            label: "Email",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          PassInputTextField(
                              controller: passwordController,
                              label: "Password",
                              obscureTextToggle: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          PassInputTextField(
                              controller: confirmedPasswordController,
                              label: "Confirm password",
                              obscureTextToggle: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }),
                          const SizedBox(height: 30),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RegistrationButton(
                        label: "SIGN UP",
                        onTap: SignUserUp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ALREADY HAVE AN ACCOUNT?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
                              child: const Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Color(0xFF129A7F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
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