import "package:flutter/material.dart";

/*
  Navigation provider to keep track of the current active route
  that is part of the mobile navigation bar.
*/
class NavigationProvider extends ChangeNotifier {
  // Index of the selected route
  int _selectedIndex = 1;

  // Returns the current selected route index
  int get selectedIndex => _selectedIndex;

  // Set the current selected route index
  void setSelectedIndex({
    required int index
  }) {
    _selectedIndex = index;
    // Notify all the listeners of this change
    notifyListeners();
  }
}