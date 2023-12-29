import 'package:flutter/cupertino.dart';
import 'package:healthlog/homescreen.dart';

import 'login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF129A7F),
        title: const Center(
          child: Row(children: [
            SizedBox(width: 100),
            Icon(Icons.medical_services_rounded),

          ]),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            width: screenSize.width,
            color: const Color(0xFF129A7F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("WELCOME TO HEALTH LOG!", style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,),),
                      Text("LET'S SET UP YOUR ACCOUNT",
                        style: TextStyle(color: Colors.black, fontSize: 20),),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          const Text("FIRST NAME",
                                            style: TextStyle(fontSize: 20),),
                                          SizedBox(
                                            width: 120,
                                            child: TextFormField(decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Colors.black12,
                                              filled: true,
                                            ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 100,),
                                      Column(
                                        children: [
                                          const Text("LAST NAME",
                                            style: TextStyle(fontSize: 20),),
                                          SizedBox(
                                            width: 120,
                                            child: TextFormField(decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Colors.black12,
                                              filled: true,
                                            ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 15,),
                                  const Text("EMAIL",
                                    style: TextStyle(fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.black12,
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(height: 25,),
                                  const Text("PASSWORD",
                                    style: TextStyle(fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(CupertinoIcons.eye),
                                      border: InputBorder.none,
                                      fillColor: Colors.black12,
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(height: 25,),
                                  const Text("RE-ENTER PASSWORD",
                                    style: TextStyle(fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(CupertinoIcons.eye),
                                      border: InputBorder.none,
                                      fillColor: Colors.black12,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(height: 35),
                                  Center(
                                    child: Container(
                                      constraints: const BoxConstraints.tightForFinite(
                                        width: 300,
                                        height: 60,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromRGBO(255, 168, 115, 1),
                                      ),
                                      child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                              MaterialPageRoute(
                                                builder: (context) => const HomeScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "CONTINUE",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 27,
                                            ),
                                          )),
                                    ),
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
                                            Navigator.push( context,
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
                                          )),
                                    ],
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
