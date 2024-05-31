import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/home_screen.dart';
import 'package:healthlog/screens/profile.dart';
import 'package:healthlog/screens/reminders/reminders_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {

  int pageIndex = 1;

  final List<Widget> _pages = [
    const ProfilePage(),
    HomeScreen(),
    Reminders(initialTabIndex: 0),
  ];

  final _items = [
    const Icon(Icons.person , color: Colors.white,),
    const Icon(Icons.home_rounded, color: Colors.white,),
    const Icon(Icons.alarm, color: Colors.white,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Theme.of(context).splashColor,
        animationDuration: const Duration(milliseconds: 300),
        index: pageIndex,
        onTap: (selectedIndex) {
          setState(() {
            pageIndex = selectedIndex;
          });
        },
        items: _items,
        // type: BottomNavigationBarType.fixed,   //law aktar mn 3 items
      ),
    );
  }
}