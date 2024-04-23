import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../ui_components/registration_button.dart';
import '../../ui_components/registration_input.dart';
import 'login.dart';
import '../../ui_components/registrationAppBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  //details controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();

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
        if(passwordController.text != confirmedPasswordController.text){
          Navigator.pop(context);
          PassErrorMessage();
        } else {
          //passwords match
        try  {
        // creating user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // user details
          await FirebaseFirestore.instance.collection('users').add({
            'email': emailController.text,
            'first name': firstName.text,
            'last name': lastName.text,
          });

      }on FirebaseAuthException catch (e) {
          if (e.code == "email-already-in-use") {
            SignedErrorMessage();
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const Login(),
              ),
            );
          }
        }
    }
  }
  void PassErrorMessage() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("passwords dont match"),
      ));

  void SignedErrorMessage() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("You already have an account \n Try signing in"),
      ));

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
                                width: screenSize.width/2.5,
                                child: InputTextField(controller: firstName,label: "First Name",obscureText: false,),
                              ),
                              SizedBox(
                                width: screenSize.width/2.5,
                                child: InputTextField(controller: lastName,label: "Last Name",obscureText: false,),
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
                            suffIcon: const Icon(Icons.remove_red_eye_rounded),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InputTextField(controller: confirmedPasswordController,
                            label: "Confirm password", obscureText: true, suffIcon: Icon(Icons.remove_red_eye_rounded),),
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
                                    builder: (context) =>
                                        Login(),
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
          ],
        ),
      ),
    );
  }
}