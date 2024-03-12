import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/reminders/reminders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex =1;
  List<Widget> body=[
    Icon(Icons.home_rounded),
    // Reminders(),
    Text("Home"),
    Icon(Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hello username"),
        actions: [
          Icon(
            Icons.settings,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.white,
      //   color: Theme.of(context).primaryColor,
      //   buttonBackgroundColor: Theme.of(context).primaryColor,
      //   animationDuration: const Duration(milliseconds: 300),
      //
      //   onTap: (index){
      //   },
      //
      //   items: const [
      //   Icon(Icons.home_rounded , color: Colors.white,),
      //   Icon(Icons.add_alarm_outlined),
      //   Icon(Icons.add_alarm_outlined),
      // ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
        ],
      ),

      body: body[_currentIndex],
    );
  }
}