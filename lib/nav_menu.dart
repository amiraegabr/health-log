import 'package:flutter/material.dart';

class nav_menu extends StatelessWidget {
  const nav_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.orange,

          ),
        ],
      ),
    );
  }
}
