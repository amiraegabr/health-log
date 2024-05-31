import 'package:flutter/material.dart';
import '../ui_components/profile_cards.dart';
import 'profileScreens/doctors.dart';
import 'profileScreens/insurances.dart';
import 'profileScreens/medical_files.dart';
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //     MedicalID(),
                  //   ),
                  // );
                },
                child: const ProfileCards(
                  leading: Icon(Icons.person, size: 36,),
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
                child: const ProfileCards(
                  leading: Icon(Icons.verified_user_rounded,size: 36,),
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
                      MedicalRecords(),
                    ),
                  );
                },
                child: const ProfileCards(
                  leading: Icon(Icons.collections_bookmark_rounded, size: 36,),
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
                child: const ProfileCards(
                  leading: Icon(Icons.vaccines_rounded, size: 36,),
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
                       Doctors(),
                    ),
                  );
                },
                child: const ProfileCards(
                  leading: Icon(Icons.people_alt_rounded, size: 36,),
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
                child: const ProfileCards(
                  leading: Icon(Icons.note_alt_rounded, size: 36,),
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