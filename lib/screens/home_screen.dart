import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/settings.dart';
import 'package:healthlog/ui_components/no_app_card.dart';
import 'package:healthlog/ui_components/symptoms_card.dart';

import '../ui_components/no_files_card.dart';
import '../ui_components/no_meds_card.dart';

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SymptomsCard(),
                SizedBox(height: 30,),
                NoMedsCard(),
                SizedBox(height: 30,),
                NoAppsCard(),
                SizedBox(height: 30,),
                NoFilesCard(),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}