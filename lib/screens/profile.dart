import 'package:flutter/material.dart';

import 'profileScreens/doctors.dart';
import 'profileScreens/insurances.dart';
import 'profileScreens/medical_id.dart';
import 'profileScreens/medical_records.dart';
import 'profileScreens/medications.dart';
import 'profileScreens/notes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 15,),
              const Text(
                "USER NAME",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const MedicalID(),
                    ),
                  );
                },
                child: ProfileCards(
                  leading: const Icon(Icons.person, size: 36,),
                  title: "Medical ID",
                  subtitle: "Your personal and medical information",
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const Insurances(),
                    ),
                  );
                },
                child: ProfileCards(
                  leading: const Icon(Icons.verified_user_rounded,size: 36,),
                  title: "Insurances",
                  subtitle: "Check your insurances",
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const MedicalRecords(),
                    ),
                  );
                },
                child: ProfileCards(
                  leading: const Icon(Icons.collections_bookmark_rounded, size: 36,),
                  title: "Medical Records",
                  subtitle: "Medical and Pending Records",
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const Medications(),
                    ),
                  );
                },
                child: ProfileCards(
                  leading: const Icon(Icons.vaccines_rounded, size: 36,),
                  title: "Medications",
                  subtitle: "You don't have any medications yet",
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const Doctors(),
                    ),
                  );
                },
                child: ProfileCards(
                  leading: const Icon(Icons.people_alt_rounded, size: 36,),
                  title: "Doctors",
                  subtitle: "Check your doctors' saved information ",
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const Notes(),
                    ),
                  );
                },
                child: ProfileCards(
                  leading: const Icon(Icons.note_alt_rounded, size: 36,),
                  title: "Notes",
                  subtitle: "You don't have any notes yet",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final leading;

  const ProfileCards({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Theme.of(context).cardColor,
      child: ListTile(
        // onTap: (){},
        iconColor: Theme.of(context).primaryColor,
        titleTextStyle: const TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.w400),
        leading: Container(
          padding: EdgeInsets.zero,
          height: 42,
          width: 42,
          decoration: BoxDecoration(
              // color: Theme.of(context).cardColor,
            // color: Colors.green,
              borderRadius: BorderRadius.circular(20)),

          child: leading,
        ),
        title: Text(
          title,),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}