import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Hero(
              tag: 'appBarTitle',
              child: Text('Profile Page'),
            ),
          ),
          body: child!,
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "USER NAME",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedicalID(),
                        ),
                      );
                    },
                    child: ProfileCards(
                      leading: Container(
                        padding: EdgeInsets.zero,
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.person, size: 36),
                      ),
                      title: "Medical ID",
                      subtitle: "Your personal and medical information",
                    ),
                  ),
                  // More ProfileCards here...
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;

  const ProfileCards({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () {},
        iconColor: Theme.of(context).primaryColor,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        leading: Container(
          padding: EdgeInsets.zero,
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: leading,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

class MedicalID extends StatelessWidget {
  const MedicalID({ icon = const Icon(Icons.person), super.key });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical ID'),
      ),
      body: Center(
        child: icon,
      ),
    );
  }
}

// More profile screens here...
