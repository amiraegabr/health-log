import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/ui_components/navigation_bar.dart';
import 'screens/registrationScreens/login.dart';

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
            return AppNavigation();
          }
          //user not logged in
          else{
            return Login();
          }
        },
      ),
    );
  }
}