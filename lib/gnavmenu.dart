// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:healthlog/add_medication.dart';
// import 'package:healthlog/home_screen.dart';
// import 'package:healthlog/reminders/reminders.dart';
//
// class NavMenu extends StatefulWidget {
//   const NavMenu({super.key});
//
//   @override
//   State<NavMenu> createState() => _NavMenuState();
// }
//
// class _NavMenuState extends State<NavMenu> {
//   int _selectedIndex = 1;
//
//   void _navigateBottomBar(int index){
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List<Widget> _pages = [
//     const Reminders(),
//     const homeScreen(),
//     const Add_Medication(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         color: const Color(0xFF129A7F),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GNav(
//             onTabChange: _navigateBottomBar,
//
//             gap: 16,
//             activeColor: Colors.black,
//             color: Colors.white,
//             tabBackgroundColor: const Color(0xffB1DDD5),
//             padding: const EdgeInsets.all(10),
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//
//             tabs: const [
//               GButton(icon: Icons.access_time_outlined, text: "Reminders",),
//               GButton(icon: Icons.home , text: "Home",),
//               GButton(icon: Icons.timeline, text: "Vitals",),
//
//           ],
//           ),
//         ),
//       ),
//
//       body: _pages[_selectedIndex],
//     );
//   }
// }