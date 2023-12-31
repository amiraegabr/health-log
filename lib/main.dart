import 'package:flutter/material.dart';
import 'package:healthlog/nav_menu.dart';
import 'login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0x129A7F)
        ),
        useMaterial3: true,
      ),
      home:  nav_menu(),
    );
  }
}
