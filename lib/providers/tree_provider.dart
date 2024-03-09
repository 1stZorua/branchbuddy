import "package:branchbuddy/models/tree.dart";
import "package:flutter/material.dart";
import "package:hive_flutter/adapters.dart";

/*
  Tree provider to keep track of all the trees,
  add trees, and remove trees.
*/
class TreeProvider extends ChangeNotifier {
  // The Hive tree box which contains all the tree data
  final Box<Tree> _treeBox = Hive.box("treeBox");

  // Returns all the trees
  List<Tree> get trees => _treeBox.values.toList();

  // Add the given tree
  void addTree(Tree tree) {
    _treeBox.add(tree);
    // Notify all the listeners of this change
    notifyListeners();
  }

  // Remove the tree with the given index
  void removeTree(int index) {
    _treeBox.deleteAt(index);
    // Notify all the listeners of this change
    notifyListeners();
  }
}