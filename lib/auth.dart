import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/registrationScreens/signup.dart';
import 'package:healthlog/ui_components/navigation_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user logged in
          if (snapshot.hasData){
            return const AppNavigation();
          }
          //user not logged in
          else{
            return const SignUp();
          }
        },
      ),
    );
  }
}