import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/settings.dart';
import 'package:healthlog/ui_components/symptoms_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: Column(
            children: [
              SymptomsCard(),

            ],
          ),
        ),
      ),
    );
  }
}