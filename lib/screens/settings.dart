import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/registrationScreens/signup.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> logUserOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text("Settings page"),
          ),
          IconButton(
            onPressed: () {
              logUserOut().then((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              });
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}