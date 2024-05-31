import 'package:flutter/material.dart';
import 'package:healthlog/services/api_caller.dart';

class SelectedSymptomsProvider extends ChangeNotifier {
  List<int> _selectedIndices = [];

  List<int> get selectedIndices => _selectedIndices;

  void addSelectedIndex(int index) {
    if (_selectedIndices.length < 5) {
      _selectedIndices.add(index);
      notifyListeners();
    }
  }

  void removeSelectedIndex(int index) {
    if (_selectedIndices.contains(index)) {
      _selectedIndices.remove(index);
      notifyListeners();
    }
  }
}
