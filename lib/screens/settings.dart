import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void SignUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text("Settings page"),
          ),
          IconButton(onPressed: (){
            SignUserOut;
          }, icon: Icon(Icons.logout_rounded)),
        ],
      ),
    );
  }
}