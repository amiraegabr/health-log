import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthlog/add_medication.dart';
import 'package:healthlog/homescreen.dart';
import 'package:healthlog/reminders.dart';

class nav_menu extends StatefulWidget {
  const nav_menu({super.key});

  @override
  State<nav_menu> createState() => _nav_menuState();
}

class _nav_menuState extends State<nav_menu> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = [
    HomeScreen(),
    Reminders(),
    Add_Medication(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        ],

      ),

      // Container(
      //   color: Color(0xFF129A7F),
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      //     child: GNav(
      //       gap: 20,
      //       backgroundColor: Color(0xFF129A7F),
      //       activeColor: Color(0x129A7F),
      //       tabBackgroundColor: Color(0x129A7F),
      //       padding: EdgeInsets.all(16),
      //
      //       tabs: [
      //       GButton(icon: Icons.home , text: "Home",),
      //       GButton(icon: Icons.timeline, text: "Vitals",),
      //       GButton(icon: Icons.access_time_outlined, text: "Reminders",),
      //     ],
      //     ),
      //   ),
      // ),

      body: _pages[_selectedIndex],
    );
  }
}
