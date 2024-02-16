import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/gnavmenu.dart';
import 'package:healthlog/reminders/reminders.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hello username"),
        actions: [
          Icon(Icons.settings , color: Theme.of(context).primaryColor,),
          const SizedBox(width: 20,)
        ],
      ),

      // bottomNavigationBar: NavMenu(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        animationDuration: Duration(milliseconds: 300),
        
        onTap: (index){

        },

        items: const [
        Icon(Icons.home_rounded , color: Colors.white,),
        Icon(Icons.add_alarm_outlined),
        Icon(Icons.add_alarm_outlined),
      ],
      ),

      body: const Center(child: Text("Homescreen")),
    );
  }
}