import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/registrationScreens/reset_password.dart';
import 'package:healthlog/ui_components/navigation_bar.dart';
import 'package:healthlog/ui_components/registration_button.dart';
import 'package:healthlog/ui_components/registration_input.dart';
import '../../ui_components/registrationAppBar.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //log user in
  void LogUserIn() async {
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
          email: emailController.text, password: passwordController.text);
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
      if (e.code == "user-not-found" || e.code == 'wrong-password') {
        print("no user for this mail");
        ErrorMessage("Incorrect email or password");
      }
    }
  }

  //error message
  void ErrorMessage(String s) =>
      showDialog(
          context: context,
          builder: (context) =>
          const AlertDialog(
            title: Text("Incorrect email or password"),
          ));

  //empty controllers
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }


@override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
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
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("WELCOME BACK!",
                      style: Theme
                          .of(context)
                          .textTheme
                          .displayLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "LOG IN TO YOUR ACCOUNT",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall,
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
                      Column(children: [
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
                          suffIcon: const Icon(Icons.remove_red_eye_rounded),
                        ),
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
                      ]),
                      RegistrationButton(
                        label: "LOG IN",
                        onTap: LogUserIn,
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
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
      ),
    );
  }
}