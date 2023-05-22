import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  String id;
  String todotext;
  bool completed;
  String category;
  Todo(
      {required this.id,
      required this.todotext,
      required this.category,
      required this.completed});
  void toggleCompleted(Todo ele) {
    ele.completed = !ele.completed;
    notifyListeners();
  }
}
