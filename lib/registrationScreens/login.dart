import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/home_screen.dart';
import 'package:healthlog/registrationScreens/registrationAppBar.dart';
import 'package:healthlog/registrationScreens/reset_password.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  Text("WELCOME BACK!",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "LOG INTO YOUR ACCOUNT",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 10,
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
                  padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email / Phone number",
                            // labelStyle: TextStyle(
                            //     color: Theme.of(context).primaryColor),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).primaryColor)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: const Icon(CupertinoIcons.eye),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .primaryColor)),

                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context
                                ,MaterialPageRoute(
                                  builder: (context) =>
                                      const forgetPass(),
                                ),
                              );
                            },
                            child: const Text(
                              'FORGOT PASSWORD?',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints:
                            const BoxConstraints.tightForFinite(
                          width: 300,
                          height: 60,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              Theme.of(context).splashColor,
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "LOG IN",)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'DON\'T HAVE AN ACCOUNT?',
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
                                    builder: (context) =>
                                        const SignUp(),
                                  ),
                                );
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Color(0xFF129A7F),
                                  fontSize: 20,
                                ),
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