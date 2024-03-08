import "package:branchbuddy/models/tree.dart";
import "package:flutter/material.dart";
import "package:hive_flutter/adapters.dart";

class TreeProvider extends ChangeNotifier {
  final Box<Tree> _treeBox = Hive.box("treeBox");

  List<Tree> get trees => _treeBox.values.toList();

  void addTree(Tree tree) {
    _treeBox.add(tree);
    notifyListeners();
  }

  void removeTree(int index) {
    _treeBox.deleteAt(index);
    notifyListeners();
  }
}