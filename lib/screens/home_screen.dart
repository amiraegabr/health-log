import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/settings.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Hello ${user.email}" ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const SettingsPage(),
                ),
              );
            },
            icon: Icon(
            Icons.settings,
            color: Theme
                .of(context)
                .primaryColor,
          ),),

          const SizedBox(
            width: 20,
          )
        ],
      ),

      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}