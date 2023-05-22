import 'package:flutter/material.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_model.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({super.key});

  Color categoryColor(String category) {
    if (category == "Personal")
      return Colors.blue;
    else if (category == "Business")
      return Colors.orange;
    else
      return Colors.pink;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskprovider, child) => ListView.builder(
          itemCount: taskprovider.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            final tasklist = taskprovider.todoList;
            return SizedBox(
              // width: 175,
              height: 65,
              child: Card(
                // color: Colors.indigo.shade900,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                  side: BorderSide(
                                      width: 2,
                                      color: categoryColor(taskprovider
                                          .todoList[index].category)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  value: tasklist[index].completed,
                                  onChanged: (value) {
                                    taskprovider
                                        .toggleCompleted(tasklist[index].id);
                                    // print(tasklist[index].completed);
                                  }),
                            )),
                        Expanded(
                            flex: 7,
                            child: !tasklist[index].completed
                                ? Text(
                                    tasklist[index].todotext,
                                    style: TextStyle(fontSize: 18),
                                  )
                                : Text(
                                    tasklist[index].todotext,
                                    style: TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  )),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              // alignment: Alignment.topRight,
                              onPressed: () {
                                taskprovider.remove(tasklist[index]);
                              },
                              icon: Icon(Icons.remove_circle_outline)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
