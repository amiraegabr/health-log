import 'package:flutter/material.dart';
import 'package:healthlog/home_screen.dart';
import 'package:healthlog/registrationScreens/login.dart';
import 'package:healthlog/gnavmenu.dart';
import 'package:healthlog/onboardingScreens/onboarding.dart';
import 'package:healthlog/reminders/reminders.dart';
import 'package:healthlog/reminders/calender.dart';
import 'themes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: '',
      theme: AppTheme.lightTheme,
      home: const SafeArea(
        bottom: false,
          child: Login(),
      ),
    );
  }
}