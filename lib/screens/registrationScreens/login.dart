import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/registrationScreens/reset_password.dart';
import 'package:healthlog/ui_components/navigation_bar.dart';
import 'package:healthlog/ui_components/registration_button.dart';
import 'package:healthlog/ui_components/registration_input.dart';
import '../../ui_components/registrationAppBar.dart';
import '../../ui_components/registration_password_input.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true;

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //log user in
  void logUserIn() async {

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // Display snack bar message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email and password fields cannot be empty.'),
        ),
      );
      return; // Exit the function if fields are empty
    }

    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try log in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text.trim());
      //pop loading circle
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppNavigation(),
        ),
      );
    }
    //wrong email or password
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if ( e.code.contains('wrong-password')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email and password don't match"),
          ),
        );
      } else if (e.code.contains("user-not-found")) {
        // User does not exist, display message and navigate to sign up page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not found. Sign up instead!"),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went wrong. Please try again!"),
            ), );
      }
    }
  }


  // empty controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: const RegistrationAppBar(),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //top part
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("WELCOME BACK!",
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "LOG IN TO YOUR ACCOUNT",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //main part
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
                    const SizedBox(height: 10,),
                    Column(children: [
                      InputTextField(
                        preIcon: const Icon(Icons.mail_outline_rounded),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgetPass(),
                                  ),
                                );
                              },
                              child: const Text(
                                'FORGOT PASSWORD?',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ]),
                    RegistrationButton(
                      label: "LOG IN",
                      onTap: logUserIn,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "DON'T HAVE AN ACCOUNT?",
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
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              'SIGN UP',
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
    );
  }
}