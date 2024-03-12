import 'package:flutter/material.dart';
import 'package:healthlog/add_medication.dart';
import 'package:healthlog/home_screen.dart';
import 'package:healthlog/navigation_bar.dart';
import 'package:healthlog/registrationScreens/signup.dart';
import 'package:healthlog/reminders/reminders.dart';
import 'themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Future<void> main() async {

  // // firebase initialization
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
main(){

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: "Health log",
      home: const SafeArea(
        bottom: false,
          child: Reminders(),
      ),
    );
  }
}