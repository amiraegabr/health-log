import 'package:flutter/material.dart';
import 'package:healthlog/screens/profileScreens/medical_files.dart';


class NoFilesCard extends StatelessWidget {
  const NoFilesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MedicalRecords()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                spreadRadius: 4,
                offset: const Offset(10, 10),
              )
            ]),
        child: Column(
          children: [
            Image.asset(
              "assets/images/files.png",
              height: 120,

            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Save your Medical Files",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "All you important files in one place. Save them all to find them easily when you need.",
              style: TextStyle(fontSize: 18,),textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const MedicalFiles()),
                    // );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Save files now", style: TextStyle(fontWeight: FontWeight.w500),),
                  )),
            )
          ],
        ),
      ),
    );
  }
}