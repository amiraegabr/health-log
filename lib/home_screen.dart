import 'package:flutter/material.dart';
import 'package:healthlog/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hello username"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const SettingsPage(),
                ),
              );
            },
            icon: Icon(
            Icons.settings,
            color: Theme
                .of(context)
                .primaryColor,
          ),),

          const SizedBox(
            width: 20,
          )
        ],
      ),

      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}