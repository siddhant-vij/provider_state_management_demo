import 'package:flutter/material.dart';

class NumbersListProvider extends ChangeNotifier {
  List<int> numbers = [0];

  void addNumber() {
    numbers.add(numbers.last + 1);
    notifyListeners();
  }
}
