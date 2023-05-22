import 'package:flutter/material.dart';
import './todo_model.dart';
class TaskProvider with ChangeNotifier{

   List<Todo> todoList=[];
  

  void add(Todo todoitem){
    todoList.add(todoitem);
    notifyListeners();
  }
  void remove(Todo todoitem)
  {
    todoList.removeWhere((element) => element.id==todoitem.id);
    notifyListeners();
  }
  void toggleCompleted(String id)
  {
   final ele=todoList.firstWhere((element) => element.id==id);
   ele.completed=!ele.completed;
  // todoList.replaceRange(0,0,[ele]);
  notifyListeners();
  }

}