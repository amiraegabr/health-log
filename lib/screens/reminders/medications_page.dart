import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/screens/reminders/calender.dart';
import 'package:healthlog/ui_components/medication_card.dart';


class MedicationsPage extends StatefulWidget {
  const MedicationsPage({super.key});

  @override
  State<MedicationsPage> createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {
  bool? status = false;
  List<Medication> medications = [];

  @override
  void initState() {
    super.initState();
    fetchMedications();
  }

  Future<void> fetchMedications() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('medications')
          .get();
      setState(() {
        medications = querySnapshot.docs.map((doc) => Medication.fromDocument(doc)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Calendar()),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          if (medications.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final medication = medications[index];
                  return MedicineCard(medication: medication, medications: medications);
                },
                childCount: medications.length,
              ),
            ),
        ],
      ),
    );
  }
}





// Container(
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(20),
//     color: const Color.fromRGBO(177, 221, 213, 1),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.all(25.0),
//     child: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Medications for today:',
//             style: TextStyle(fontSize: 20),
//           ),
//           CheckboxListTile(
//               controlAffinity:
//               ListTileControlAffinity.leading,
//               checkColor: const Color(0xFF129A7F),
//               title: const Text(
//                 'Vitamin D',
//                 style: TextStyle(fontSize: 20),
//               ),
//               value: status,
//               onChanged: (val) {
//                 setState(() {
//                   status = val!;
//                 });
//               }),
//           CheckboxListTile(
//               controlAffinity:
//               ListTileControlAffinity.leading,
//               checkColor: const Color(0xFF129A7F),
//               title: const Text(
//                 'Vitamin D',
//                 style: TextStyle(fontSize: 20),
//               ),
//               value: status,
//               onChanged: (val) {
//                 setState(() {
//                   status = val!;
//                 });
//               }),
//           CheckboxListTile(
//               controlAffinity:
//               ListTileControlAffinity.leading,
//               checkColor: const Color(0xFF129A7F),
//               title: const Text(
//                 'Vitamin D',
//                 style: TextStyle(fontSize: 20),
//               ),
//               value: status,
//               onChanged: (val) {
//                 setState(() {
//                   status = val!;
//                 });
//               }),
//         ],
//       ),
//     ),
//   ),
// ),