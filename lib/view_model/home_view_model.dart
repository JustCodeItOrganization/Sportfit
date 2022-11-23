import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }
}
