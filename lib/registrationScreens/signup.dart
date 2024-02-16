import 'package:flutter/cupertino.dart';
import 'package:healthlog/home_screen.dart';
import 'package:healthlog/registrationScreens/registrationAppBar.dart';

import 'login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                       style: Theme.of(context).textTheme.displayMedium
                   ),
                   const SizedBox(height: 10,),
                   Text(
                     "LET'S SET UP YOUR ACCOUNT",
                     style: Theme.of(context).textTheme.displaySmall,
                   ),
                   const SizedBox(height: 10,),
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
                  child: Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width/2.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "First Name",
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
                            ),
                            SizedBox(
                              width: screenSize.width/2.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Last Name",
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                            // labelStyle: TextStyle(
                            //   color: Theme.of(context).primaryColor),
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
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Re-Enter Password",
                            suffixIcon: const Icon(CupertinoIcons.eye),
                            // labelStyle: TextStyle(
                            //   color: Theme.of(context).primaryColor),
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
                        const SizedBox(height: 30),
                        Container(
                          constraints:
                              const BoxConstraints.tightForFinite(
                            width: 300,
                            height: 60,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).splashColor
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const homeScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "CONTINUE",
                                style: TextStyle(
                                  fontSize: 27,
                                ),
                              )),
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
                                      builder: (context) =>
                                          const Login(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'LOG IN',
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
            ),
          ],
        ),
      ),
    );
  }
}