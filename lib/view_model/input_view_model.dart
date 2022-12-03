import 'package:flutter/material.dart';

class InputViewModel extends ChangeNotifier {
  String? _currentItem;
  final List<String> _items = ['item 1', 'item 2'];

  void changeCurrentItem(String? item) {
    _currentItem = item;
    notifyListeners();
  }

  List<String> get items => _items;

  String? get currentItem => _currentItem;
}
