import 'package:flutter/material.dart';
import 'package:healthlog/providers/selected_symptom_provider.dart';
import 'package:provider/provider.dart';

import '../ui_components/symptom_choices.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SelectedSymptomsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Symptom checker"),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                // searchbar
                //symptom choices
                SymptomChoices()
                //Confirm/continue button
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class SymptomChoices extends StatefulWidget {
//   const SymptomChoices({
//     super.key,
//   });
//
//   @override
//   State<SymptomChoices> createState() => _SymptomChoicesState();
// }

// class _SymptomChoicesState extends State<SymptomChoices> {
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ChoiceChip(
//         label: Text("Symptom"),
//         selected: isSelected,
//         selectedColor: Theme.of(context).primaryColor,
//         onSelected: (newState) {
//           setState(() {
//             isSelected = newState;
//           });
//         },
//       ),
//     );
//   }
// }