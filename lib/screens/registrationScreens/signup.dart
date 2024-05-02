import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../ui_components/registration_button.dart';
import '../../ui_components/registration_input.dart';
import '../../ui_components/registrationAppBar.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  //details controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  //sign user in
  Future<void> signUserUp() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //check password match
    if (passwordController.text != confirmedPasswordController.text) {
      Navigator.pop(context);
      showErrorDialog('Passwords do not match');
      return;
    }

    //passwords match
    try {
      // creating user
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // user details
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': emailController.text,
        'first name': firstNameController.text,
        'last name': lastNameController.text,
      });

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        showErrorDialog('Email already in use');
      } else {
        showErrorDialog('Sign up failed');
      }
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
      ),
    );
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WELCOME TO HEALTH LOG!",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "LET'S SET UP YOUR ACCOUNT",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10),
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
                              Expanded(
                                child: InputTextField(
                                  controller: firstNameController,
                                  label: "First Name",
                                  obscureText: false,
                                ),
                              ),
                              Expanded(
                                child: InputTextField(
                                  controller: lastNameController,
                                  label: "Last Name",
                                  obscureText: false,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InputTextField(
                            controller: emailController,
                            label: "Email / Phone number",
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InputTextField(
                            controller: passwordController,
                            label: "Password",
                            obscureText: true,
                            suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InputTextField(
                            controller: confirmedPasswordController,
                            label: "Confirm password",
                            obscureText: true,
                            suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RegistrationButton(
                        label: "SIGN UP",
                        onTap: signUserUp,
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
                                fontSize: 20,
                              ),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmedPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
