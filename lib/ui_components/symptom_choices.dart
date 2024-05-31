import 'package:flutter/material.dart';
import 'package:healthlog/providers/selected_symptom_provider.dart';
import 'package:healthlog/services/api_caller.dart';
import 'package:provider/provider.dart';

class SymptomChoices extends StatelessWidget {
  const SymptomChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedSymptomsProvider>(
      builder: (context, selectedSymptomsProvider, _) {
        return SymptomChoicesWidget(selectedSymptomsProvider: selectedSymptomsProvider);
      },
    );
  }
}

class SymptomChoicesWidget extends StatefulWidget {
  final SelectedSymptomsProvider selectedSymptomsProvider;

  const SymptomChoicesWidget({Key? key, required this.selectedSymptomsProvider}) : super(key: key);

  @override
  _SymptomChoicesWidgetState createState() => _SymptomChoicesWidgetState();
}

class _SymptomChoicesWidgetState extends State<SymptomChoicesWidget> {
  List<String> symptoms = [];
  List<int> selectedIndices = [];
  List<String> filteredSymptoms = [];
  String searchText = '';
  bool isLoading = true;
  late Map<String, int> rpm;
  int selectedItemNumber = 1;

  @override
  void initState() {
    super.initState();
    fetchSymptoms();
    rpm = {};
  }

  Future<void> fetchSymptoms() async {
    try {
      final symptomsResponse = await ApiCaller().fetchSymptoms();
      setState(() {
        symptoms = symptomsResponse.symptoms;
        filteredSymptoms = symptoms;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching symptoms: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void removeValue(Map<String, int> map, int value) {
    var keyToRemove;
    map.forEach((key, val) {
      if (val == value) {
        keyToRemove = key;
      }
    });
    if (keyToRemove != null) {
      map.remove(keyToRemove);
    }
  }

  void filterSymptoms(String query) {
    setState(() {
      searchText = query;
      filteredSymptoms = symptoms.where((symptom) => symptom.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  String getSelectedSymptoms() {
    return rpm.values.map((e) => symptoms[e]).join(' & ');
  }

  Future<void> sendSelectedIndices() async {
    // Show a popup modal
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Your selections have been submitted: ${getSelectedSymptoms()}'),
          actions: [
            TextButton(
              onPressed: () async {
                try {
                  // Prepare the request model
                  final request = RequestPredictionModel(symptoms: rpm);
                  // Fetch prediction result
                  final response = await ApiCaller().fetchPredictionResult(request);
                  // Show result
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Prediction Result'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Disease: ${response.disease}'),
                            Text('Description: ${response.description}'),
                            Text('Precautions:'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: response.precautions
                                  .map((precaution) => Text('- $precaution'))
                                  .toList(),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } catch (e) {
                  print('Error fetching prediction result: $e');
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to fetch prediction result'),
                    ),
                  );
                }
              },
              child: Text('CONFIRM'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
      children: [
        TextField(
          onChanged: filterSymptoms,
          decoration: const InputDecoration(
            hintText: 'Search symptoms...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: List<Widget>.generate(filteredSymptoms.length, (index) {
            final selectedIndex = symptoms.indexOf(filteredSymptoms[index]);
            final isSelected = selectedIndices.contains(selectedIndex);
            return ChoiceChip(
              label: Text(filteredSymptoms[index]),
              selected: isSelected,
              selectedColor: Theme.of(context).primaryColor,
              onSelected: (selected) {
                setState(() {
                  if (selected && selectedIndices.length < 5) {
                    rpm["S${selectedItemNumber}"] = selectedIndex;
                    selectedIndices.add(selectedIndex);
                    selectedItemNumber++;
                    print(rpm);
                  } else if (!selected && selectedIndices.contains(selectedIndex)) {
                    selectedIndices.remove(selectedIndex);
                    removeValue(rpm, selectedIndex);
                    selectedItemNumber--;
                    print(rpm);
                  }
                });
              },
            );
          }),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await sendSelectedIndices();
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
