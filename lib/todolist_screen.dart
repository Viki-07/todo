import 'package:flutter/material.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_model.dart';

class TodolistScreen extends StatelessWidget {
  TodolistScreen({super.key});

  Color categoryColor(String category) {
    if (category == "Personal") {
      return Colors.blue;
    } else if (category == "Business") {
      return Color.fromARGB(255, 185, 199, 30);
    } else if (category == "Home") {
      return Colors.teal;
    } else {
      return Colors.pinkAccent;
    }
  }

  final List<String> list = <String>['Personal', 'Business', 'Work', 'Home'];

  Future<dynamic> showsheet(
      BuildContext context,
      String dropdownValue,
      TaskProvider taskprovider,
      TextEditingController tasktext,
      Todo todoitem) {
    return showModalBottomSheet(
        elevation: 20,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  alignment: Alignment.topCenter,
                  // height: 50,
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: tasktext,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Task',
                      hintText: 'Enter Task',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Category : '),
                        Container(
                          alignment: Alignment.topCenter,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            // style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              // color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                ),
                ElevatedButton(
                    onPressed: () {
                      taskprovider.update(Todo(
                          id: todoitem.id,
                          category: dropdownValue,
                          todotext: tasktext.text,
                          completed: todoitem.completed));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Done'))
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskprovider, child) => taskprovider.tempList.isEmpty
          ? const Center(
              child: Text('To-Do List is Empty',style: TextStyle(color: Colors.white),),
            )
          : ListView.builder(
            physics: BouncingScrollPhysics(),
              itemCount: taskprovider.tempList.length,
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                final tasklist = taskprovider.tempList;
                //  var x=tasklist.category;
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    height: 70,
                    child: GestureDetector(
                      onTap: () {
                        final tasktext = TextEditingController();
                        tasktext.text = tasklist[index].todotext;
                        showsheet(context, tasklist[index].category,
                            taskprovider, tasktext, tasklist[index]);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                          color: Color.fromARGB(255, 3, 25, 86),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Transform.scale(
                                  scale: 1.8,
                                  child: Checkbox(
                                      side: BorderSide(
                                          width: 1.8,
                                          color: categoryColor(taskprovider
                                              .tempList[index].category)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      value: tasklist[index].completed,
                                      onChanged: (value) {
                                        // print(value);
                                        taskprovider.toggleCompleted(
                                            taskprovider.tempList[index]);
                                      }),
                                ),
                              ),
                              !tasklist[index].completed
                                  ? Expanded(
                                      flex: 3,
                                      child: Text(
                                        tasklist[index].todotext,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )
                                  : Expanded(
                                      flex: 3,
                                      child: Text(
                                        tasklist[index].todotext,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          decorationThickness: 3,
                                          decorationColor: Colors.white,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                              Expanded(
                                child: IconButton(
                                   color: Colors.white60,
                                    // alignment: Alignment.topRight,
                                    onPressed: () {
                                      taskprovider.remove(tasklist[index]);
                                    },
                                    icon: const Icon(
                                        Icons.remove_circle_outline)),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              }),
    );
  }
}
