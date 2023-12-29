
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/homescreen.dart';
import 'package:healthlog/reset_password.dart';
import 'signup.dart';


class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF129A7F),
        title: const Center(
          child: Row(children: [
            SizedBox(width: 50),
            Icon(Icons.medical_services_rounded),
            Text("  HEALTH LOG"),
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
                      Text("WELCOME BACK!", style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                      Text("LOG INTO YOUR ACCOUNT",
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
                                  const Text("EMAIL / PHONE NUMBER",
                                    style: TextStyle(fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  TextFormField(decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black12,
                                    filled: true,
                                  ),
                                  ),
                                  const SizedBox(height: 35,),
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
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [

                                      const SizedBox(width: 165,),
                                      TextButton(onPressed: () {
                                        Navigator.push( context,
                                          MaterialPageRoute(
                                            builder: (context) => const forgetPass(),
                                          ),
                                        );
                                      },
                                          child: const Text('FORGOT PASSWORD?',style: TextStyle(fontSize: 16,color: Colors.black),))
                                    ],
                                  ),
                                  const SizedBox(height: 80),
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
                                            "LOG IN",
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
                                        'DON\'T HAVE AN ACCOUNT?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push( context,
                                              MaterialPageRoute(
                                                builder: (context) => const SignUp(),
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
