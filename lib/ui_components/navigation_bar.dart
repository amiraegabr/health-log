import 'package:flutter/material.dart';
import 'package:healthlog/screens/home_screen.dart';
import 'package:healthlog/screens/profile.dart';
import 'package:healthlog/screens/reminders/reminders.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const ProfilePage(),
    const HomeScreen(),
    const Reminders(),
  ];

  final List<BottomNavigationBarItem> _bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.person, color: Colors.white),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded, color: Colors.white),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.alarm, color: Colors.white),
      label: 'Reminders',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).splashColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _bottomItems,
      ),
    );
  }
}
