import "package:flutter/material.dart";

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex({
    required int index
  }) {
    _selectedIndex = index;
    notifyListeners();
  }
}