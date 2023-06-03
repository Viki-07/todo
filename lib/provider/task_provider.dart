import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import './todo_model.dart';
import 'package:todo/main.dart';

class TaskProvider with ChangeNotifier {
  //  Box<Todo> TodoBox = Hive.box<Todo>('TaskDb');

  var todoList = TodoBox.values.toList();
  // List<dynamic> tempList = todoList;
  void add(Todo todoitem) {
    TodoBox.put(todoitem.id, todoitem);
    todoList = TodoBox.values.toList();
    tempList = todoList;
    notifyListeners();
  }

  // List<dynamic> get templist=>todoList;
  late List<dynamic> tempList = todoList;
  void changeCategory(List<dynamic> newList) {
    tempList = newList;
    notifyListeners();
  }
  // todoList;

  void remove(Todo todoitem) {
    TodoBox.delete(todoitem.id);
    // print(todoList);
    todoList = TodoBox.values.toList();
    tempList = todoList;
    notifyListeners();
  }

  void update(Todo todoitem) {
    TodoBox.put(todoitem.id, todoitem);
    todoList = TodoBox.values.toList();
    tempList = todoList;
    notifyListeners();
  }

  void toggleCompleted(Todo todoitem) {
    todoitem.completed = !todoitem.completed;
    TodoBox.put(todoitem.id, todoitem);
    notifyListeners();
  }
}
